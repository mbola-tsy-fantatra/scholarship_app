import 'package:auto_route/auto_route.dart';
import 'package:scholariship/core/routes/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route'  )
class AppRouter extends $AppRouter {

  @override
  List<AutoRoute> get routes => [
    /// routes go here
    AutoRoute(
        path: '/',
        page: LoginRoute.page
    ),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: PasswordRecoveryRoute.page),
    AutoRoute(
        path:'/navigation',
        page: NavigationRoute.page,
        children: [
          AutoRoute(page: ScholarshipRoute.page),
          AutoRoute(page: ProfileRoute.page),
          AutoRoute(page: MessageRoute.page),
          AutoRoute(page: NotificationRoute.page),
        ]
    )
  ];
}