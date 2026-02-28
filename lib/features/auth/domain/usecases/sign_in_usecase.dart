import 'package:dartz/dartz.dart';
import 'package:flutter_task/config/service_locator/service_locator.dart';
import 'package:flutter_task/core/error/failure.dart';
import 'package:flutter_task/core/usecase/usecase.dart';
import 'package:flutter_task/features/auth/domain/repositories/auth_repositories.dart';

class SignInUseCase extends UseCase<bool, Map<String, dynamic>>{

  @override
  Future<Either<Failure, bool>> call({Map<String, dynamic>? params}) async =>
      await sl<AuthRepositories>().signIn(body: params ?? {});

}