// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:scholariship/core/routes/navigation_screen.dart' as _i6;
import 'package:scholariship/features/auth/presentation/views/login_view.dart'
    as _i4;
import 'package:scholariship/features/auth/presentation/views/password_recovery_view.dart'
    as _i8;
import 'package:scholariship/features/auth/presentation/views/register_view.dart'
    as _i10;
import 'package:scholariship/features/connection/presentation/views/connnection_view.dart'
    as _i1;
import 'package:scholariship/features/connection/presentation/views/request_sent_view.dart'
    as _i12;
import 'package:scholariship/features/connection/presentation/views/request_view.dart'
    as _i11;
import 'package:scholariship/features/home/presentation/views/home_view.dart'
    as _i3;
import 'package:scholariship/features/messages/presentation/views/conversation_list_view.dart'
    as _i2;
import 'package:scholariship/features/messages/presentation/views/message_view.dart'
    as _i5;
import 'package:scholariship/features/notifications/presentation/views/notification_view.dart'
    as _i7;
import 'package:scholariship/features/profile/presentation/views/profile_view.dart'
    as _i9;
import 'package:scholariship/features/scholariship/presentation/views/scholarship_creation_view.dart'
    as _i13;
import 'package:scholariship/features/scholariship/presentation/views/scholarship_view.dart'
    as _i14;
import 'package:scholariship/features/setting/presentation/views/setting_view.dart'
    as _i15;

abstract class $AppRouter extends _i16.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    ConnectionRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ConnectionScreen(),
      );
    },
    ConversationListRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ConversationListScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginScreen(),
      );
    },
    MessageRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MessageScreen(),
      );
    },
    NavigationRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.NavigationScreen(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.NotificationScreen(),
      );
    },
    PasswordRecoveryRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.PasswordRecoveryScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ProfileScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.RegisterScreen(),
      );
    },
    RequestRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.RequestScreen(),
      );
    },
    RequestSentRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.RequestSentScreen(),
      );
    },
    ScholarshipCreationRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.ScholarshipCreationScreen(),
      );
    },
    ScholarshipRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.ScholarshipScreen(),
      );
    },
    SettingRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.SettingScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.ConnectionScreen]
class ConnectionRoute extends _i16.PageRouteInfo<void> {
  const ConnectionRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ConnectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConnectionRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ConversationListScreen]
class ConversationListRoute extends _i16.PageRouteInfo<void> {
  const ConversationListRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ConversationListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConversationListRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute({List<_i16.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute({List<_i16.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i5.MessageScreen]
class MessageRoute extends _i16.PageRouteInfo<void> {
  const MessageRoute({List<_i16.PageRouteInfo>? children})
      : super(
          MessageRoute.name,
          initialChildren: children,
        );

  static const String name = 'MessageRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i6.NavigationScreen]
class NavigationRoute extends _i16.PageRouteInfo<void> {
  const NavigationRoute({List<_i16.PageRouteInfo>? children})
      : super(
          NavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigationRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i7.NotificationScreen]
class NotificationRoute extends _i16.PageRouteInfo<void> {
  const NotificationRoute({List<_i16.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i8.PasswordRecoveryScreen]
class PasswordRecoveryRoute extends _i16.PageRouteInfo<void> {
  const PasswordRecoveryRoute({List<_i16.PageRouteInfo>? children})
      : super(
          PasswordRecoveryRoute.name,
          initialChildren: children,
        );

  static const String name = 'PasswordRecoveryRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ProfileScreen]
class ProfileRoute extends _i16.PageRouteInfo<void> {
  const ProfileRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i10.RegisterScreen]
class RegisterRoute extends _i16.PageRouteInfo<void> {
  const RegisterRoute({List<_i16.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i11.RequestScreen]
class RequestRoute extends _i16.PageRouteInfo<void> {
  const RequestRoute({List<_i16.PageRouteInfo>? children})
      : super(
          RequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'RequestRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i12.RequestSentScreen]
class RequestSentRoute extends _i16.PageRouteInfo<void> {
  const RequestSentRoute({List<_i16.PageRouteInfo>? children})
      : super(
          RequestSentRoute.name,
          initialChildren: children,
        );

  static const String name = 'RequestSentRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i13.ScholarshipCreationScreen]
class ScholarshipCreationRoute extends _i16.PageRouteInfo<void> {
  const ScholarshipCreationRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ScholarshipCreationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScholarshipCreationRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i14.ScholarshipScreen]
class ScholarshipRoute extends _i16.PageRouteInfo<void> {
  const ScholarshipRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ScholarshipRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScholarshipRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i15.SettingScreen]
class SettingRoute extends _i16.PageRouteInfo<void> {
  const SettingRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}
