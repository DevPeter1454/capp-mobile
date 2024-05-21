
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:capp/core/constants/api_route_constant.dart';
import 'package:capp/core/handlers/handlers.dart';
import 'package:capp/core/network/base_api_client.dart';
import 'package:capp/core/network/connectivity.dart';
import 'package:shared_preferences/shared_preferences.dart';


final locator = GetIt.instance;

final sharedPreferences =  SharedPreferences.getInstance();
 Future<void> setupLocator() async{
  // Register your classes here
  locator
      ..registerLazySingleton<Dio>(() => Dio(BaseOptions(baseUrl: ApiConstant.baseUrl, followRedirects: true)))
   ..registerLazySingleton<BaseApiClient>(() => BaseApiClient())

   //* Network Status
  ..registerLazySingleton<ConnectivityService>(() => ConnectivityService())


  //* Data Sources

   //* Repositories


   //* Usecases



  //* Util
  ..registerLazySingleton<DialogHandler>(() => DialogHandlerImpl());

}