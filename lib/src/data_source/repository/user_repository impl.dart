import 'package:capp/src/constants/api_route_constant.dart';
import 'package:capp/src/data_source/network/api_client.dart';
import 'package:capp/src/data_source/network/exceptions/network_exception.dart';
import 'package:capp/src/data_source/network/shared_preference_service.dart';
import 'package:capp/src/domain/model/userdata.dart';
import 'package:capp/src/domain/repository/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final DioClient dioClient;
  final SharedPreferencesService sharedPreferencesService;

  UserRepositoryImpl(this.dioClient, this.sharedPreferencesService);

  @override
  Future<void> editUserInfo({required Map<String, dynamic> userData}) async {
    try {
      print("here");
      final response =
          await dioClient.dioPatch("https://capp-api-7d8a6573f031.herokuapp.com/api/v1/user/auth/update_user", userData,
              options: Options(headers: {
                'Authorization': 'Bearer ${sharedPreferencesService.authToken}',
              }));
      print('response is ${response.data}');

      // return UserData();
    } on DioException catch (e) {
      print(e);
      throw NetworkException.fromDioError(e);
    }
  }

  @override
  Future<UserData> getUserInfo() async {
    try {
      final response = await dioClient.dioGet('https://capp-api-7d8a6573f031.herokuapp.com/api/v1/user/auth/info');
      // print('response is $response');
      // print('response is ${response.data}');
      // print('response is ${response.data['data']}');

      return UserData.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    }
  }

  @override
  Future<void> logOut() async {
    await sharedPreferencesService.clear();
  }

  @override
  Future<void> resetPassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    await dioClient.dioPost('https://capp-api-7d8a6573f031.herokuapp.com/api/v1/user/auth/change_pass', {
      "old_password": oldPassword,
      "new_password": newPassword,
    });
  }
}
