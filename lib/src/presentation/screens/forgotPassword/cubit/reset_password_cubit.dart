import 'package:bloc/bloc.dart';
import 'package:capp/src/data_source/network/exceptions/network_exception.dart';
import 'package:capp/src/domain/repository/auth_repository.dart';
import 'package:capp/src/domain/repository/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'reset_password_cubit.freezed.dart';
part 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepository authRepository;
  final UserRepository userRepository;
  ResetPasswordCubit(this.authRepository, this.userRepository)
      : super(const ResetPasswordState.initial());

  Future<void> confirmEmail({required String email}) async {
    emit(const ResetPasswordState.loading());
    try {
      await authRepository.confirmEmail(email: email);
      emit(const ResetPasswordState.confirmEmailSuccessfully());
    } on NetworkException catch (e) {
      emit(ResetPasswordState.error(e.message));
    } catch (e) {
      emit(ResetPasswordState.error(e.toString()));
    }
  }

  Future<void> resetPassword(
      {required String oldPassword, required String newPassword}) async {
    emit(const ResetPasswordState.loading());
    try {
      await userRepository.resetPassword(
          oldPassword: oldPassword, newPassword: newPassword);
      emit(const ResetPasswordState.resetPasswordSuccessfully());
    } on NetworkException catch (e) {
      emit(ResetPasswordState.error(e.message));
    } catch (e) {
      emit(ResetPasswordState.error(e.toString()));
    }
  }
}
