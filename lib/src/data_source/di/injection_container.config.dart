// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:capp/src/data_source/di/module/app_module.dart' as _i16;
import 'package:capp/src/data_source/network/api_client.dart' as _i7;
import 'package:capp/src/data_source/network/connectivity.dart' as _i3;
import 'package:capp/src/data_source/network/shared_preference_service.dart'
    as _i6;
import 'package:capp/src/data_source/repository/auth_repository_impl.dart'
    as _i11;
import 'package:capp/src/data_source/repository/user_repository%20impl.dart'
    as _i9;
import 'package:capp/src/domain/repository/auth_repository.dart' as _i10;
import 'package:capp/src/domain/repository/user_repository.dart' as _i8;
import 'package:capp/src/handlers/dialog_handler.dart' as _i4;
import 'package:capp/src/presentation/screens/dashboard/tabs/profile/cubit/user_profile_cubit.dart'
    as _i15;
import 'package:capp/src/presentation/screens/forgotPassword/cubit/reset_password_cubit.dart'
    as _i13;
import 'package:capp/src/presentation/screens/login/cubit/login_cubit.dart'
    as _i12;
import 'package:capp/src/presentation/screens/signup/cubit/sign_up_cubit.dart'
    as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i3.ConnectivityService>(() => _i3.ConnectivityService());
    gh.lazySingleton<_i4.DialogHandler>(() => _i4.DialogHandlerImpl());
    await gh.factoryAsync<_i5.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i6.SharedPreferencesService>(
        () => _i6.SharedPreferencesService(gh<_i5.SharedPreferences>()));
    gh.lazySingleton<_i7.DioClient>(
        () => _i7.DioClient(gh<_i6.SharedPreferencesService>()));
    gh.singleton<_i8.UserRepository>(() => _i9.UserRepositoryImpl(
          gh<_i7.DioClient>(),
          gh<_i6.SharedPreferencesService>(),
        ));
    gh.singleton<_i10.AuthRepository>(() => _i11.AuthRepositoryImpl(
          gh<_i7.DioClient>(),
          gh<_i6.SharedPreferencesService>(),
        ));
    gh.factory<_i12.LoginCubit>(
        () => _i12.LoginCubit(gh<_i10.AuthRepository>()));
    gh.factory<_i13.ResetPasswordCubit>(() => _i13.ResetPasswordCubit(
          gh<_i10.AuthRepository>(),
          gh<_i8.UserRepository>(),
        ));
    gh.factory<_i14.SignUpCubit>(
        () => _i14.SignUpCubit(gh<_i10.AuthRepository>()));
    gh.factory<_i15.UserProfileCubit>(
        () => _i15.UserProfileCubit(gh<_i8.UserRepository>()));
    return this;
  }
}

class _$AppModule extends _i16.AppModule {}
