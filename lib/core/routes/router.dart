import 'package:auto_route/auto_route.dart';
import 'package:scholariship/core/routes/router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/injection_container.dart';
import 'auth_guard.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route'  )
class AppRouter extends $AppRouter {

  @override
  List<AutoRoute> get routes => [
    /// routes go here
    AutoRoute(
        path: '/login',
        page: LoginRoute.page
    ),
    AutoRoute(
      path: '/register',
        page: RegisterRoute.page
    ),
    AutoRoute(page: PasswordRecoveryRoute.page),
    AutoRoute(
        path:'/',
        initial: true,
        page: NavigationRoute.page,
        guards: [AuthGuard(sl<SharedPreferences>())],
        children: [
          AutoRoute(page: HomeRoute.page),
          AutoRoute(page: ScholarshipRoute.page),
          AutoRoute(page: ConnectionRoute.page),
          AutoRoute(page: ConversationListRoute.page),
          AutoRoute(page: NotificationRoute.page),
        ]
    ),
    AutoRoute(
        path: '/create-scholarship',
        page: ScholarshipCreationRoute.page,
        guards: [AuthGuard(sl<SharedPreferences>())]
    ),
    AutoRoute(
        path: '/setting',
        page:SettingRoute.page
    ),
    AutoRoute(
      page: DiscussionRoute.page,
      path: '/discussions/:conversationId',
      guards: [AuthGuard(sl<SharedPreferences>())]
    ),
    AutoRoute(
        path: '/request',
        page: RequestRoute.page
    ),
    AutoRoute(
        path: '/request-sent',
        page: RequestSentRoute.page
    ),
    AutoRoute(
        path: '/profile/:profileId',
        page: ProfileRoute.page
    ),
    AutoRoute(
        path: '/suggestions',
        page: SuggestionRoute.page
    ),
    AutoRoute(
        path: '/personal/profile/:profileId',
        page: PersonalProfileRoute.page
    ),
    AutoRoute(
        path: '/splash-screen',
        page: SplashRoute.page
    ),
    AutoRoute(
        path: '/profile-creation/:userId',
        page: ProfileCreationRoute.page
    ),
    AutoRoute(
        path: '/interest-creation',
        page: InterestRoute.page
    )
  ];
}