import 'package:dartz/dartz.dart';
import 'package:untitled/core/connection/network_info.dart';
import 'package:untitled/core/errors/expentions.dart';
import 'package:untitled/core/errors/failure.dart';
import 'package:untitled/core/params/params.dart';
import 'package:untitled/future/user_future/data/datasoures/user_local_data_source.dart';
import 'package:untitled/future/user_future/data/datasoures/user_remote_data_source.dart';
import 'package:untitled/future/user_future/domain/entites/user_entitey.dart';
import 'package:untitled/future/user_future/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  // للانها حلقه الوصلdomainمن extends UserRepositoryهنا عملنا
  final NetworkInfo networkInfo;
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  UserRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, UserEntity>> getUser(
      //  UserRepositoryبتاعتfunction للoverrideعملنا هنا
      {required UserParams params}) async {
    if (await networkInfo.isConnected!) {
      //عملنا تحقق لو في انترنت
      try {
        final remoteUser =
            await remoteDataSource.getUser(params); //apiبتاعتfunctionهيشغل
        localDataSource.cacheUser(remoteUser); //casheوبعدها يحفظهم في
        return Right(remoteUser);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        //casheسوف يجيب اخر منتج انضاف في
        final localUser = await localDataSource.getLastUser();
        return Right(localUser);
      } on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
