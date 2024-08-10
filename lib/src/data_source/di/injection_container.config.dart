// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:capp/src/data_source/di/module/app_module.dart' as _i40;
import 'package:capp/src/data_source/network/api_client.dart' as _i7;
import 'package:capp/src/data_source/network/connectivity.dart' as _i3;
import 'package:capp/src/data_source/network/shared_preference_service.dart'
    as _i6;
import 'package:capp/src/data_source/repository/auth_repository_impl.dart'
    as _i28;
import 'package:capp/src/data_source/repository/civic_education_repository_impl.dart'
    as _i30;
import 'package:capp/src/data_source/repository/fgn_support_repository_impl.dart'
    as _i9;
import 'package:capp/src/data_source/repository/know_your_leader_repository_impl.dart'
    as _i11;
import 'package:capp/src/data_source/repository/know_your_mda_repository_impl.dart'
    as _i14;
import 'package:capp/src/data_source/repository/policy_library_repository_impl.dart'
    as _i17;
import 'package:capp/src/data_source/repository/political_party_repository_impl.dart'
    as _i19;
import 'package:capp/src/data_source/repository/quiz_repository_impl.dart'
    as _i21;
import 'package:capp/src/data_source/repository/user_repository%20impl.dart'
    as _i25;
import 'package:capp/src/domain/repository/auth_repository.dart' as _i27;
import 'package:capp/src/domain/repository/civic_education_repository.dart'
    as _i29;
import 'package:capp/src/domain/repository/fgn_support_repository.dart' as _i8;
import 'package:capp/src/domain/repository/know_your_leader_repository.dart'
    as _i10;
import 'package:capp/src/domain/repository/know_your_mda_repository.dart'
    as _i13;
import 'package:capp/src/domain/repository/policy_library_repository.dart'
    as _i16;
import 'package:capp/src/domain/repository/political_party_repository.dart'
    as _i18;
import 'package:capp/src/domain/repository/quiz_repository.dart' as _i20;
import 'package:capp/src/domain/repository/user_repository.dart' as _i24;
import 'package:capp/src/handlers/dialog_handler.dart' as _i4;
import 'package:capp/src/presentation/screens/dashboard/tabs/profile/cubit/user_profile_cubit.dart'
    as _i38;
import 'package:capp/src/presentation/screens/explore/civic_education/cubit/civic_education_cubit.dart'
    as _i39;
import 'package:capp/src/presentation/screens/explore/civic_education/quiz/cubit/quiz_cubit.dart'
    as _i35;
import 'package:capp/src/presentation/screens/explore/fgn_support_scheme/cubit/support_scheme_cubit.dart'
    as _i23;
import 'package:capp/src/presentation/screens/explore/join_a_political_party/cubit/political_party_cubit.dart'
    as _i34;
import 'package:capp/src/presentation/screens/explore/know_your_leaders/cubit/know_your_leaders_cubit.dart'
    as _i12;
import 'package:capp/src/presentation/screens/explore/know_your_leaders/pages/leader_profile/cubit/leader_profile_cubit.dart'
    as _i15;
import 'package:capp/src/presentation/screens/explore/know_your_leaders/pages/rate_leader/cubit/rate_leader_cubit.dart'
    as _i22;
import 'package:capp/src/presentation/screens/explore/know_your_mda/cubit/know_your_mda_cubit.dart'
    as _i31;
import 'package:capp/src/presentation/screens/explore/policy_library/cubit/policy_library_cubit.dart'
    as _i33;
import 'package:capp/src/presentation/screens/explore/policy_library/pages/cubit/add_new_collection_cubit.dart'
    as _i26;
import 'package:capp/src/presentation/screens/forgotPassword/cubit/reset_password_cubit.dart'
    as _i36;
import 'package:capp/src/presentation/screens/login/cubit/login_cubit.dart'
    as _i32;
import 'package:capp/src/presentation/screens/signup/cubit/sign_up_cubit.dart'
    as _i37;
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
    gh.singleton<_i8.FgnSupportRepository>(() => _i9.FgnSupportRepositoryImpl(
          gh<_i7.DioClient>(),
          gh<_i6.SharedPreferencesService>(),
        ));
    gh.singleton<_i10.KnowYourLeaderRepository>(
        () => _i11.KnowYourLeaderRepositoryImpl(
              gh<_i7.DioClient>(),
              gh<_i6.SharedPreferencesService>(),
            ));
    gh.factory<_i12.KnowYourLeadersCubit>(
        () => _i12.KnowYourLeadersCubit(gh<_i10.KnowYourLeaderRepository>()));
    gh.singleton<_i13.KnowYourMdaRepository>(
        () => _i14.KnowYourMdaRepositoryImpl(
              gh<_i7.DioClient>(),
              gh<_i6.SharedPreferencesService>(),
            ));
    gh.factory<_i15.LeaderProfileCubit>(
        () => _i15.LeaderProfileCubit(gh<_i10.KnowYourLeaderRepository>()));
    gh.singleton<_i16.PolicyLibraryRepository>(
        () => _i17.PolicyLibraryRepositoryImpl(
              gh<_i7.DioClient>(),
              gh<_i6.SharedPreferencesService>(),
            ));
    gh.singleton<_i18.PoliticalPartyRepository>(
        () => _i19.PoliticalPartyRepositoryImpl(
              gh<_i7.DioClient>(),
              gh<_i6.SharedPreferencesService>(),
            ));
    gh.singleton<_i20.QuizRepository>(() => _i21.QuizRepositoryImpl(
          gh<_i7.DioClient>(),
          gh<_i6.SharedPreferencesService>(),
        ));
    gh.factory<_i22.RateLeaderCubit>(
        () => _i22.RateLeaderCubit(gh<_i10.KnowYourLeaderRepository>()));
    gh.factory<_i23.SupportSchemeCubit>(
        () => _i23.SupportSchemeCubit(gh<_i8.FgnSupportRepository>()));
    gh.singleton<_i24.UserRepository>(() => _i25.UserRepositoryImpl(
          gh<_i7.DioClient>(),
          gh<_i6.SharedPreferencesService>(),
        ));
    gh.factory<_i26.AddNewCollectionCubit>(
        () => _i26.AddNewCollectionCubit(gh<_i16.PolicyLibraryRepository>()));
    gh.singleton<_i27.AuthRepository>(() => _i28.AuthRepositoryImpl(
          gh<_i7.DioClient>(),
          gh<_i6.SharedPreferencesService>(),
        ));
    gh.singleton<_i29.CivicEducationRepository>(
        () => _i30.CivicEducationRepositoryImpl(
              gh<_i7.DioClient>(),
              gh<_i6.SharedPreferencesService>(),
            ));
    gh.factory<_i31.KnowYourMdaCubit>(
        () => _i31.KnowYourMdaCubit(gh<_i13.KnowYourMdaRepository>()));
    gh.factory<_i32.LoginCubit>(
        () => _i32.LoginCubit(gh<_i27.AuthRepository>()));
    gh.factory<_i33.PolicyLibraryCubit>(
        () => _i33.PolicyLibraryCubit(gh<_i16.PolicyLibraryRepository>()));
    gh.factory<_i34.PoliticalPartyCubit>(
        () => _i34.PoliticalPartyCubit(gh<_i18.PoliticalPartyRepository>()));
    gh.factory<_i35.QuizCubit>(() => _i35.QuizCubit(gh<_i20.QuizRepository>()));
    gh.factory<_i36.ResetPasswordCubit>(() => _i36.ResetPasswordCubit(
          gh<_i27.AuthRepository>(),
          gh<_i24.UserRepository>(),
        ));
    gh.factory<_i37.SignUpCubit>(
        () => _i37.SignUpCubit(gh<_i27.AuthRepository>()));
    gh.factory<_i38.UserProfileCubit>(
        () => _i38.UserProfileCubit(gh<_i24.UserRepository>()));
    gh.factory<_i39.CivicEducationCubit>(
        () => _i39.CivicEducationCubit(gh<_i29.CivicEducationRepository>()));
    return this;
  }
}

class _$AppModule extends _i40.AppModule {}
