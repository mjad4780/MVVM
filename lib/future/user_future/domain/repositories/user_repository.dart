import 'package:dartz/dartz.dart';
import 'package:untitled/core/errors/failure.dart';
import 'package:untitled/future/user_future/domain/entites/user_entitey.dart';

abstract class UserRepository {
  // functionنضع فيها
  Future<Either<Failure, UserEntity>> getUser();
  //use dart z becouse 2 return Failure, UserEntity
}
