import 'package:dartz/dartz.dart';
import 'package:flutter_task/config/service_locator/service_locator.dart';
import 'package:flutter_task/core/error/failure.dart';
import 'package:flutter_task/features/auth/data/datasource/remote_datasource/auth_remote_datasource.dart';
import 'package:flutter_task/features/auth/domain/repositories/auth_repositories.dart';

class AuthRepositoriesImpl implements AuthRepositories{

  @override
  Future<Either<Failure, bool>> signIn({required Map<String, dynamic> body}) async =>
      await sl<AuthRemoteDatasource>().signIn(body: body);

}