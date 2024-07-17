import 'package:capp/src/constants/api_route_constant.dart';
import 'package:capp/src/data_source/network/api_client.dart';
import 'package:capp/src/data_source/network/shared_preference_service.dart';
import 'package:capp/src/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final DioClient dioClient;
  final SharedPreferencesService sharedPreferencesService;

  AuthRepositoryImpl(this.dioClient, this.sharedPreferencesService);
  @override
  Future<void> logIn({required String email, required String password}) async {
    final response = await dioClient.dioPost(
       ApiConstant.login, {
      "email": email,
      "password": password,
    });
    final result = response.data;
    await sharedPreferencesService.setAuthToken(result['token']);
  }

  @override
  Future<void> resendOTP() {
    // TODO: implement resendOTP
    throw UnimplementedError();
  }

  @override
  Future<void> confirmEmail({required String email}) async {
    final response = await dioClient.dioPost(
        'https://capp-api-7d8a6573f031.herokuapp.com/api/v1/user/auth/reset_password',
        {
          "email": email,
        });
    // print('response is ${response.data}');
    final token = response.data['token'];
    await sharedPreferencesService.setAuthToken(token);
  }

  @override
  Future<void> signUp({
    required String firstname,
    required String surname,
    required String phone,
    required String password,
    required String state,
    required String lga,
    required String email,
  }) async {
    final response = await dioClient.dioPost(
        'https://capp-api-7d8a6573f031.herokuapp.com/api/v1/user/auth/register',
        {
          "state": state,
          "firstname": firstname,
          "surname": surname,
          "email": email,
          "phone": phone,
          "password": password,
          "lga": lga
        });
    print('sign up response is ${response.data}');
    final result = response.data;
    await sharedPreferencesService.setAuthToken(result['data']);
  }

  @override
  Future<void> verifyOTP() {
    // TODO: implement verifyOTP
    throw UnimplementedError();
  }
}
