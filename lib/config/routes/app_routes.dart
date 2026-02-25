
import 'package:flutter/material.dart';
import 'package:flutter_task/config/routes/route_error_page.dart';
import 'package:flutter_task/features/home/home_routes.dart';
import 'package:flutter_task/features/home/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

// Global navigator key to access the navigator state from anywhere in the app.
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


/// A class that holds the application's routing configuration.
class AppRouter {
  // Private constructor to prevent instantiation.
  AppRouter._(); 

  /// The main GoRouter instance for the application.
  static final GoRouter routes = GoRouter(
    // The navigator key is used to access the navigator state.
    navigatorKey: navigatorKey,
    // The initial route to be displayed when the app starts.
    initialLocation: HomePage.path,
    debugLogDiagnostics: true,
    // The builder for the error page that is displayed when a route is not found.
    errorBuilder: (context,state)=> ErrorPage(state: state),
    // A redirect function that can be used to redirect users based on application state.
    redirect: (BuildContext context, GoRouterState state){
      return null;
    },
    // The list of top-level routes in the application.
    routes: [

      /// Splash Routes
      ...HomeRouter.routes,

    ]
  );
}
