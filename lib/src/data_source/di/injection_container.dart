
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:capp/src/constants/api_route_constant.dart';
import 'package:capp/src/handlers/handlers.dart';
import 'package:capp/src/data_source/network/base_api_client.dart';
import 'package:capp/src/data_source/network/connectivity.dart';
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