import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_task/config/service_locator/service_locator.dart';
import 'package:flutter_task/core/constants/api_urls.dart';
import 'package:flutter_task/core/error/failure.dart';
import 'package:flutter_task/core/network/dio_client.dart';


sealed class AuthRemoteDatasource {
  Future<Either<Failure, bool>> signIn({required Map<String,dynamic> body});
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource{

  @override
  Future<Either<Failure, bool>> signIn({required Map<String, dynamic> body}) async {
    try{
      Response response = await sl<DioClient>().post(
          ApiUrls.signIn,
          data: body
      );
      return Right(response.statusCode == 200 || response.statusCode == 201);
    }catch(error, stackTrace){
      log(
          "Auth Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }

}