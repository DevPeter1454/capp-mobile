abstract class AuthRepository {
  Future<void> signUp({
    required String firstname,
    required String surname,
    required String phone,
    required String password,
    required String state,
    required String lga,
    required String email,
  });
  Future<void> logIn({required String email, required String password});
  Future<void> verifyOTP();
  Future<void> confirmEmail({required String email});
  Future<void> resendOTP();
}
