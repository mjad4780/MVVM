import 'package:dartz/dartz.dart';
import 'package:untitled/core/errors/failure.dart';
import 'package:untitled/core/params/params.dart';
import 'package:untitled/future/user_future/domain/entites/user_entitey.dart';
import 'package:untitled/future/user_future/domain/repositories/user_repository.dart';

class GetUser {
  final UserRepository repository;

  GetUser({required this.repository});
  Future<Either<Failure, UserEntity>> call({required UserParams params}) {
    return repository.getUser(params: params);
  }
}
