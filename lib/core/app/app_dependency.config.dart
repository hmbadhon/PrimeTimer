// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:prime_timer/core/app/app_dependency.dart' as _i461;
import 'package:prime_timer/core/app/app_preference.dart' as _i619;
import 'package:prime_timer/data/network/api_client.dart' as _i473;
import 'package:prime_timer/features/screens/home/cubit/home_cubit.dart'
    as _i792;
import 'package:prime_timer/features/screens/home/repository/home_repo.dart'
    as _i976;
import 'package:prime_timer/features/screens/home/repository/home_repo_imp.dart'
    as _i266;
import 'package:prime_timer/features/screens/no_internet/cubit/internet_cubit.dart'
    as _i622;
import 'package:prime_timer/features/screens/theme/cubit/theme_cubit.dart'
    as _i515;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i619.AppPreferences>(() => _i619.AppPreferences());
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => appModule.prefs,
    preResolve: true,
  );
  gh.factory<_i361.Dio>(() => appModule.dio);
  gh.factory<_i515.ThemeCubit>(() => _i515.ThemeCubit());
  gh.factory<_i622.InternetCubit>(() => _i622.InternetCubit());
  gh.factory<_i473.ApiClient>(() => _i473.ApiClient(gh<_i361.Dio>()));
  gh.factory<_i266.HomeRepositoryImp>(
      () => _i976.HomeRepository(apiClient: gh<_i473.ApiClient>()));
  gh.factory<_i792.HomeCubit>(
      () => _i792.HomeCubit(gh<_i266.HomeRepositoryImp>()));
  return getIt;
}

class _$AppModule extends _i461.AppModule {}
