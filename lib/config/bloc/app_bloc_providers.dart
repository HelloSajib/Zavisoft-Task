
import 'package:flutter_bloc/flutter_bloc.dart';

/// Provides a centralized list of all BLoC/Cubit providers for the app.
class AppBlocProviders {
  const AppBlocProviders._();

  /// The list of all [BlocProvider]s used in the application.
  static List<BlocProvider> get providers => [

     // BlocProvider<ThemeCubit>(create: (context)=> ThemeCubit()..getThemeMode()),
     // BlocProvider<OnboardingCubit>(create: (context)=> OnboardingCubit()..userAlreadyOnboarded()),

  ];

}
