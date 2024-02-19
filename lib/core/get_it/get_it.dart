import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled/core/connection/network_info.dart';
import 'package:untitled/core/databases/api/dio_consumer.dart';
import 'package:untitled/core/databases/cache/cache_helper.dart';
import 'package:untitled/future/user_future/data/datasoures/user_local_data_source.dart';
import 'package:untitled/future/user_future/data/datasoures/user_remote_data_source.dart';

final getIt = GetIt.instance;
void setupServise() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: getIt<Dio>()));
  getIt.registerSingleton<DataConnectionChecker>(DataConnectionChecker());
  getIt.registerSingleton<NetworkInfoImpl>(
      NetworkInfoImpl(getIt<DataConnectionChecker>()));
  getIt.registerSingleton<UserRemoteDataSource>(
      UserRemoteDataSource(api: getIt<DioConsumer>()));
  getIt.registerSingleton<UserLocalDataSource>(
      UserLocalDataSource(cache: getIt<CacheHelper>()));
}
