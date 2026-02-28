import 'package:go_router/go_router.dart';
import 'package:flutter_task/config/routes/router_transition.dart';
import 'package:flutter_task/features/auth/presentation/pages/sign_in_page.dart';

class AuthRouter {
  AuthRouter._();

  static final List<GoRoute> routes = [

    /// Sign In Page Route
    GoRoute(
      path: SignInPage.path,
      name: SignInPage.name,
      pageBuilder: (context, state){
        return CustomTransitionPage(
            key: state.pageKey,
            child: SignInPage(),
            transitionsBuilder: routerTransition
        );
      },
    ),

  ];

}