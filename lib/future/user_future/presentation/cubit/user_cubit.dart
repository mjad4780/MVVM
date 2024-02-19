import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/connection/network_info.dart';
import 'package:untitled/core/databases/api/api_consumer.dart';
import 'package:untitled/core/databases/api/dio_consumer.dart';
import 'package:untitled/core/databases/cache/cache_helper.dart';
import 'package:untitled/core/get_it/get_it.dart';
import 'package:untitled/core/params/params.dart';
import 'package:untitled/future/user_future/data/datasoures/user_local_data_source.dart';
import 'package:untitled/future/user_future/data/datasoures/user_remote_data_source.dart';
import 'package:untitled/future/user_future/data/repositorries/user_repositoru_impl.dart';
import 'package:untitled/future/user_future/domain/usescase/get_user.dart';
import 'package:untitled/future/user_future/presentation/cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  eitherFailureOrUser(int id) async {
    emit(GetUserLoading());
    final failureOrUser = await GetUser(
      repository: UserRepositoryImpl(
          remoteDataSource: getIt<UserRemoteDataSource>(),
          localDataSource: getIt<UserLocalDataSource>(),
          networkInfo: getIt<NetworkInfoImpl>()),
    ).call(
      params: UserParams(
        id: id.toString(),
      ),
    );

    failureOrUser.fold(
      (failure) => emit(GetUserFailure(errMessage: failure.errMessage)),
      (user) => emit(GetUserSuccessfully(user: user)),
    );
  }
}
