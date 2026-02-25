import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';
import 'config/bloc/app_bloc_providers.dart';
import 'config/routes/app_routes.dart';


/// The root widget of the Zavisoft application.
class ZavisoftApp extends StatelessWidget {
  /// Creates a [ZavisoftApp].
  const ZavisoftApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initializes screen utilities to make the UI responsive across different screen sizes.
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // A wrapper to enable toast notifications throughout the app.
      child: ToastificationWrapper(
        // Provides all BLoCs and Cubits to the entire widget tree.
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.routes,
        ),
      ),
    );
  }
}
