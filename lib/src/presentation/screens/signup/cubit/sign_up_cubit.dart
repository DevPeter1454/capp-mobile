import 'package:bloc/bloc.dart';
import 'package:capp/src/data_source/network/exceptions/network_exception.dart';
import 'package:capp/src/domain/repository/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_cubit.freezed.dart';
part 'sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository authRepository;
  SignUpCubit(this.authRepository) : super(const SignUpState.initial());

  void signUpUser({
    required String firstname,
    required String surname,
    required String phone,
    required String password,
    required String state,
    required String lga,
    required String email,
  }) async {
    emit(const SignUpState.loading());
    try {
      await authRepository.signUp(
          email: email,
          password: password,
          lga: lga,
          state: state,
          firstname: firstname,
          phone: phone,
          surname: surname);
      emit(const SignUpState.signUpSuccessful());
    } on NetworkException catch (exception) {
      emit(SignUpState.error(exception.message));
    } catch (e) {
      emit(SignUpState.error(e.toString()));
    }
  }
}
