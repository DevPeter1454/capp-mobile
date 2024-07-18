import 'package:capp/src/domain/model/userdata.dart';

abstract class UserRepository {
  Future<UserData> getUserInfo();
  Future<void> editUserInfo({required Map<String, dynamic> userData});
  Future<void> resetPassword(
      {required String oldPassword, required String newPassword});
  Future<void> logOut();
}
