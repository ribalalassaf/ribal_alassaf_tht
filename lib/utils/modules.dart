import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_file_store/dio_cache_interceptor_file_store.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ribal_alassaf_tht/config/injectable.dart';
import 'package:ribal_alassaf_tht/utils/dio_interceptor.dart';

@module
abstract class Modules {
  @LazySingleton()
  Dio get dio => Dio()
    ..interceptors.addAll([
      DioInterceptor(),
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          return handler.next(options);
        },
      ),
    ]);

  @preResolve
  Future<CacheStore> get cacheStore async {
    final tempDir = await getApplicationCacheDirectory();
    return FileCacheStore(tempDir.path);
  }

  @Named('caching')
  @LazySingleton()
  Dio get cachingDio {
    late CacheStore cacheStore;
    late CacheOptions cacheOptions;
    cacheStore = getIt<CacheStore>();
    cacheOptions = CacheOptions(
      store: cacheStore,
      policy: CachePolicy.forceCache,
      maxStale: const Duration(days: 7),
      priority: CachePriority.high,
    );

    return Dio()
      ..interceptors.addAll([
        DioInterceptor(),
        DioCacheInterceptor(options: cacheOptions),
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            return handler.next(options);
          },
        ),
      ]);
  }
}
