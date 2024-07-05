part of 'reset_password_cubit.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState.initial() = _Initial;
  const factory ResetPasswordState.loading() = _Loading;
  const factory ResetPasswordState.confirmEmailSuccessfully() = _ConfirmEmailSuccessfully;
  const factory ResetPasswordState.resetPasswordSuccessfully() = _ResetPasswordSuccessfully;
  const factory ResetPasswordState.error(String message) = _Error;
}
