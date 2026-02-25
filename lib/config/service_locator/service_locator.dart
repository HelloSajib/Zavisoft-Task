
import 'package:flutter_task/core/network/dio_client.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initServiceLocator(){

  sl.registerSingleton<DioClient>(DioClient());

  /// Remote DataSource
  // sl.registerLazySingleton<NetworkInfoRemoteDatasource>(()=> NetworkInfoRemoteDatasourceImpl());
  // sl.registerLazySingleton<ServersRemoteDatasource>(()=> ServersRemoteDatasourceImpl());
  // sl.registerLazySingleton<SpeedTestRemoteDatasource>(()=> SpeedTestRemoteDatasourceImpl());


  /// Local DataSource
  //sl.registerSingleton<OnboardingLocalDatasource>(OnboardingLocalDatasourceImpl());

  /// Repositories
  //sl.registerLazySingleton<OnboardingRepositories>(()=> OnboardingRepositoriesImpl());


  /// UseCase
  /// Onboarding UseCases
  //sl.registerLazySingleton<AlreadyOnboardedUseCase>(()=> AlreadyOnboardedUseCase());
  //sl.registerLazySingleton<UserOnboardedUseCase>(()=> UserOnboardedUseCase());


}