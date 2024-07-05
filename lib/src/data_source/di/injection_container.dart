import 'package:capp/src/data_source/di/injection_container.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// final locator = GetIt.instance;

// final sharedPreferences =  SharedPreferences.getInstance();
//  Future<void> setupLocator() async{
//   // Register your classes here
//   locator
//       ..registerLazySingleton<Dio>(() => Dio(BaseOptions(baseUrl: ApiConstant.baseUrl, followRedirects: true)))
//    ..registerLazySingleton<BaseApiClient>(() => BaseApiClient())

//    //* Network Status
//   ..registerLazySingleton<ConnectivityService>(() => ConnectivityService())

//   //* Data Sources

//    //* Repositories

//    //* Usecases

//   //* Util
//   ..registerLazySingleton<DialogHandler>(() => DialogHandlerImpl());

// }

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await getIt.init();
}
