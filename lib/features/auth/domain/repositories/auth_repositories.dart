import 'package:dartz/dartz.dart';
import 'package:flutter_task/core/error/failure.dart';

abstract class AuthRepositories{
  Future<Either<Failure, bool>> signIn({required Map<String,dynamic> body});
}