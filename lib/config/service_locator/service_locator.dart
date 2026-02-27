
import 'package:flutter_task/core/network/dio_client.dart';
import 'package:flutter_task/features/data/datasource/remote_datasource/home_remote_datasource.dart';
import 'package:flutter_task/features/data/repositories/home_repositories_impl.dart';
import 'package:flutter_task/features/domain/repositories/home_repositories.dart';
import 'package:flutter_task/features/domain/usecases/get_products_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initServiceLocator(){

  sl.registerSingleton<DioClient>(DioClient());

  /// Remote DataSource
  sl.registerLazySingleton<HomeRemoteDatasource>(()=> HomeRemoteDatasourceImpl());

  /// Repositories
  sl.registerLazySingleton<HomeRepositories>(()=> HomeRepositoriesImpl());

  /// UseCase
  /// Home UseCases
  sl.registerLazySingleton<GetProductsUseCase>(()=> GetProductsUseCase());


}