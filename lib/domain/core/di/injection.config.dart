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
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../../application/core/serveice/dio_client.dart' as _i90;
import '../../../application/core/theme/theme/theme_cubit.dart' as _i756;
import '../../../application/products/cubit/product_cubit.dart' as _i740;
import '../../../application/products/cubit/product_details_cubit.dart' as _i32;
import '../../../application/products/product_repository_impl.dart' as _i950;
import '../../products/repository/i_product_repository.dart' as _i214;
import '../base/run_safely.dart' as _i530;
import 'app_injection_module.dart' as _i975;
import 'local_notification_serveice.dart' as _i793;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appInjectionModule = _$AppInjectionModule();
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => appInjectionModule.pref(),
    preResolve: true,
  );
  await gh.factoryAsync<_i975.PermissionHandler>(
    () => appInjectionModule.reqPermission(),
    preResolve: true,
  );
  await gh.factoryAsync<_i793.LocalNotification>(
    () => appInjectionModule.initLocalNotification(),
    preResolve: true,
  );
  gh.lazySingleton<_i756.ThemeCubit>(() => _i756.ThemeCubit());
  gh.lazySingleton<_i530.RunSafely>(() => _i530.RunSafely());
  gh.lazySingleton<_i361.Dio>(() => appInjectionModule.dio);
  gh.lazySingleton<_i90.DioClient>(() => _i90.DioClient(gh<_i361.Dio>()));
  gh.lazySingleton<_i214.IProductRepository>(
      () => _i950.ProductRepositoryImpl(gh<_i90.DioClient>()));
  gh.factory<_i740.ProductCubit>(
      () => _i740.ProductCubit(gh<_i214.IProductRepository>()));
  gh.factory<_i32.ProductDetailsCubit>(
      () => _i32.ProductDetailsCubit(gh<_i214.IProductRepository>()));
  return getIt;
}

class _$AppInjectionModule extends _i975.AppInjectionModule {}
