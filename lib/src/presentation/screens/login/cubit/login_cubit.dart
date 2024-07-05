import 'package:bloc/bloc.dart';
import 'package:capp/src/data_source/network/exceptions/network_exception.dart';
import 'package:capp/src/domain/repository/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;
  LoginCubit(this.authRepository) : super(const LoginState.initial());

  Future<void> login({required String email, required String password}) async {
    emit(const LoginState.loading());
    try {
      await authRepository.logIn(email: email, password: password);
      emit(const LoginState.loginSuccessful());
    } on NetworkException catch (exception) {
      emit(LoginState.error(exception.message));
    } catch (e) {
      emit(LoginState.error(e.toString()));
    }
  }
}
