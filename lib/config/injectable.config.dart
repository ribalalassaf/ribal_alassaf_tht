// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart' as _i695;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/monitoring/data/datasources/monitoring_datasource.dart'
    as _i857;
import '../features/monitoring/data/respositories/monitoring_repo_impl.dart'
    as _i625;
import '../features/monitoring/presentation/blocs/monitoring_cubit/monitoring_cubit.dart'
    as _i1051;
import '../features/monitoring/domain/repositories/monitoring_repo_abstract.dart'
    as _i218;
import '../utils/modules.dart' as _i624;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final modules = _$Modules();
    await gh.factoryAsync<_i695.CacheStore>(
      () => modules.cacheStore,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => modules.dio);
    gh.lazySingleton<_i361.Dio>(
      () => modules.cachingDio,
      instanceName: 'caching',
    );
    gh.lazySingleton<_i857.MonitoringDatasource>(() =>
        _i857.MonitoringDatasource(gh<_i361.Dio>(instanceName: 'caching')));
    gh.lazySingleton<_i218.MonitoringRepoAbstract>(
        () => _i625.MonitoringRepoImpl(gh<_i857.MonitoringDatasource>()));
    gh.factory<_i1051.MonitoringCubit>(
        () => _i1051.MonitoringCubit(gh<_i218.MonitoringRepoAbstract>()));
    return this;
  }
}

class _$Modules extends _i624.Modules {}
