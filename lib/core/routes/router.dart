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
        page: NavigationRoute.page,
        children: [
          AutoRoute(page: ScholarshipRoute.page),
          AutoRoute(page: ConnectionRoute.page),
          AutoRoute(page: ConversationListRoute.page),
          AutoRoute(page: NotificationRoute.page),
        ],
        guards: [AuthGuard(sl<SharedPreferences>())]
    ),
    AutoRoute(
        path: '/create-scholarship',
        page: ScholarshipCreationRoute.page,
        guards: [AuthGuard(sl<SharedPreferences>())]
    ),
    AutoRoute(
        path: '/setting',
        page:SettingRoute.page,
        guards: [AuthGuard(sl<SharedPreferences>())]
    ),
    AutoRoute(
      page: DiscussionRoute.page,
      path: '/discussions/:conversationId',
      guards: [AuthGuard(sl<SharedPreferences>())]
    ),
    AutoRoute(
        path: '/request',
        page: RequestRoute.page,
        guards: [AuthGuard(sl<SharedPreferences>())]
    ),
    AutoRoute(
        path: '/request-sent',
        page: RequestSentRoute.page,
        guards: [AuthGuard(sl<SharedPreferences>())]
    ),
    AutoRoute(
        path: '/profile/:profileId',
        page: ProfileRoute.page,
        guards: [AuthGuard(sl<SharedPreferences>())]
    ),
    AutoRoute(
        path: '/suggestions',
        page: SuggestionRoute.page,
        guards: [AuthGuard(sl<SharedPreferences>())]
    ),
    AutoRoute(
        path: '/personal/profile/:profileId',
        page: PersonalProfileRoute.page,
        guards: [AuthGuard(sl<SharedPreferences>())]
    ),
    AutoRoute(
        initial: true,
        path: '/splash-screen',
        page: SplashRoute.page
    ),
    AutoRoute(
        path: '/profile-creation/:userId',
        page: ProfileCreationRoute.page,
    ),
    AutoRoute(
        path: '/interest-creation',
        page: InterestRoute.page,
    )
  ];
}