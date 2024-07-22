// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i22;
import 'package:flutter/material.dart' as _i23;
import 'package:scholariship/core/routes/navigation_screen.dart' as _i7;
import 'package:scholariship/features/auth/presentation/views/login_view.dart'
    as _i6;
import 'package:scholariship/features/auth/presentation/views/password_recovery_view.dart'
    as _i9;
import 'package:scholariship/features/auth/presentation/views/register_view.dart'
    as _i13;
import 'package:scholariship/features/connection/presentation/views/connnection_view.dart'
    as _i1;
import 'package:scholariship/features/connection/presentation/views/request_sent_view.dart'
    as _i15;
import 'package:scholariship/features/connection/presentation/views/request_view.dart'
    as _i14;
import 'package:scholariship/features/connection/presentation/views/suggestion_view.dart'
    as _i21;
import 'package:scholariship/features/home/presentation/views/home_view.dart'
    as _i4;
import 'package:scholariship/features/messages/presentation/views/conversation_list_view.dart'
    as _i2;
import 'package:scholariship/features/messages/presentation/views/diiscussion_view.dart'
    as _i3;
import 'package:scholariship/features/notifications/presentation/views/notification_view.dart'
    as _i8;
import 'package:scholariship/features/onboarding_profile/presentation/views/interest_creation_screen.dart'
    as _i5;
import 'package:scholariship/features/onboarding_profile/presentation/views/profile_creation_screen.dart'
    as _i11;
import 'package:scholariship/features/onboarding_profile/presentation/views/splash_screen.dart'
    as _i20;
import 'package:scholariship/features/profile/presentation/views/personal_profile_view.dart'
    as _i10;
import 'package:scholariship/features/profile/presentation/views/profile_view.dart'
    as _i12;
import 'package:scholariship/features/scholariship/presentation/views/scholarship_creation_view.dart'
    as _i16;
import 'package:scholariship/features/scholariship/presentation/views/scholarship_detail_view.dart'
    as _i17;
import 'package:scholariship/features/scholariship/presentation/views/scholarship_view.dart'
    as _i18;
import 'package:scholariship/features/setting/presentation/views/setting_view.dart'
    as _i19;

abstract class $AppRouter extends _i22.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i22.PageFactory> pagesMap = {
    ConnectionRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ConnectionScreen(),
      );
    },
    ConversationListRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ConversationListScreen(),
      );
    },
    DiscussionRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DiscussionRouteArgs>(
          orElse: () => DiscussionRouteArgs(
              conversationId: pathParams.getString('conversationId')));
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.DiscussionScreen(
          key: args.key,
          conversationId: args.conversationId,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    InterestRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.InterestScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.LoginScreen(),
      );
    },
    NavigationRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.NavigationScreen(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.NotificationScreen(),
      );
    },
    PasswordRecoveryRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.PasswordRecoveryScreen(),
      );
    },
    PersonalProfileRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PersonalProfileRouteArgs>(
          orElse: () => PersonalProfileRouteArgs(
              profileId: pathParams.getString('profileId')));
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.PersonalProfileScreen(
          key: args.key,
          profileId: args.profileId,
        ),
      );
    },
    ProfileCreationRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProfileCreationRouteArgs>(
          orElse: () =>
              ProfileCreationRouteArgs(userId: pathParams.getString('userId')));
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.ProfileCreationScreen(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () =>
              ProfileRouteArgs(profileId: pathParams.getString('profileId')));
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.ProfileScreen(
          key: args.key,
          profileId: args.profileId,
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.RegisterScreen(),
      );
    },
    RequestRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.RequestScreen(),
      );
    },
    RequestSentRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.RequestSentScreen(),
      );
    },
    ScholarshipCreationRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.ScholarshipCreationScreen(),
      );
    },
    ScholarshipDetailRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.ScholarshipDetailScreen(),
      );
    },
    ScholarshipRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.ScholarshipScreen(),
      );
    },
    SettingRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.SettingScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.SplashScreen(),
      );
    },
    SuggestionRoute.name: (routeData) {
      return _i22.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.SuggestionScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.ConnectionScreen]
class ConnectionRoute extends _i22.PageRouteInfo<void> {
  const ConnectionRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ConnectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConnectionRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ConversationListScreen]
class ConversationListRoute extends _i22.PageRouteInfo<void> {
  const ConversationListRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ConversationListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConversationListRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DiscussionScreen]
class DiscussionRoute extends _i22.PageRouteInfo<DiscussionRouteArgs> {
  DiscussionRoute({
    _i23.Key? key,
    required String conversationId,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          DiscussionRoute.name,
          args: DiscussionRouteArgs(
            key: key,
            conversationId: conversationId,
          ),
          rawPathParams: {'conversationId': conversationId},
          initialChildren: children,
        );

  static const String name = 'DiscussionRoute';

  static const _i22.PageInfo<DiscussionRouteArgs> page =
      _i22.PageInfo<DiscussionRouteArgs>(name);
}

class DiscussionRouteArgs {
  const DiscussionRouteArgs({
    this.key,
    required this.conversationId,
  });

  final _i23.Key? key;

  final String conversationId;

  @override
  String toString() {
    return 'DiscussionRouteArgs{key: $key, conversationId: $conversationId}';
  }
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i22.PageRouteInfo<void> {
  const HomeRoute({List<_i22.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i5.InterestScreen]
class InterestRoute extends _i22.PageRouteInfo<void> {
  const InterestRoute({List<_i22.PageRouteInfo>? children})
      : super(
          InterestRoute.name,
          initialChildren: children,
        );

  static const String name = 'InterestRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LoginScreen]
class LoginRoute extends _i22.PageRouteInfo<void> {
  const LoginRoute({List<_i22.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i7.NavigationScreen]
class NavigationRoute extends _i22.PageRouteInfo<void> {
  const NavigationRoute({List<_i22.PageRouteInfo>? children})
      : super(
          NavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigationRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i8.NotificationScreen]
class NotificationRoute extends _i22.PageRouteInfo<void> {
  const NotificationRoute({List<_i22.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i9.PasswordRecoveryScreen]
class PasswordRecoveryRoute extends _i22.PageRouteInfo<void> {
  const PasswordRecoveryRoute({List<_i22.PageRouteInfo>? children})
      : super(
          PasswordRecoveryRoute.name,
          initialChildren: children,
        );

  static const String name = 'PasswordRecoveryRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i10.PersonalProfileScreen]
class PersonalProfileRoute
    extends _i22.PageRouteInfo<PersonalProfileRouteArgs> {
  PersonalProfileRoute({
    _i23.Key? key,
    required String profileId,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          PersonalProfileRoute.name,
          args: PersonalProfileRouteArgs(
            key: key,
            profileId: profileId,
          ),
          rawPathParams: {'profileId': profileId},
          initialChildren: children,
        );

  static const String name = 'PersonalProfileRoute';

  static const _i22.PageInfo<PersonalProfileRouteArgs> page =
      _i22.PageInfo<PersonalProfileRouteArgs>(name);
}

class PersonalProfileRouteArgs {
  const PersonalProfileRouteArgs({
    this.key,
    required this.profileId,
  });

  final _i23.Key? key;

  final String profileId;

  @override
  String toString() {
    return 'PersonalProfileRouteArgs{key: $key, profileId: $profileId}';
  }
}

/// generated route for
/// [_i11.ProfileCreationScreen]
class ProfileCreationRoute
    extends _i22.PageRouteInfo<ProfileCreationRouteArgs> {
  ProfileCreationRoute({
    _i23.Key? key,
    required String userId,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          ProfileCreationRoute.name,
          args: ProfileCreationRouteArgs(
            key: key,
            userId: userId,
          ),
          rawPathParams: {'userId': userId},
          initialChildren: children,
        );

  static const String name = 'ProfileCreationRoute';

  static const _i22.PageInfo<ProfileCreationRouteArgs> page =
      _i22.PageInfo<ProfileCreationRouteArgs>(name);
}

class ProfileCreationRouteArgs {
  const ProfileCreationRouteArgs({
    this.key,
    required this.userId,
  });

  final _i23.Key? key;

  final String userId;

  @override
  String toString() {
    return 'ProfileCreationRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [_i12.ProfileScreen]
class ProfileRoute extends _i22.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i23.Key? key,
    required String profileId,
    List<_i22.PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            profileId: profileId,
          ),
          rawPathParams: {'profileId': profileId},
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i22.PageInfo<ProfileRouteArgs> page =
      _i22.PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    required this.profileId,
  });

  final _i23.Key? key;

  final String profileId;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, profileId: $profileId}';
  }
}

/// generated route for
/// [_i13.RegisterScreen]
class RegisterRoute extends _i22.PageRouteInfo<void> {
  const RegisterRoute({List<_i22.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i14.RequestScreen]
class RequestRoute extends _i22.PageRouteInfo<void> {
  const RequestRoute({List<_i22.PageRouteInfo>? children})
      : super(
          RequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'RequestRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i15.RequestSentScreen]
class RequestSentRoute extends _i22.PageRouteInfo<void> {
  const RequestSentRoute({List<_i22.PageRouteInfo>? children})
      : super(
          RequestSentRoute.name,
          initialChildren: children,
        );

  static const String name = 'RequestSentRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i16.ScholarshipCreationScreen]
class ScholarshipCreationRoute extends _i22.PageRouteInfo<void> {
  const ScholarshipCreationRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ScholarshipCreationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScholarshipCreationRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i17.ScholarshipDetailScreen]
class ScholarshipDetailRoute extends _i22.PageRouteInfo<void> {
  const ScholarshipDetailRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ScholarshipDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScholarshipDetailRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i18.ScholarshipScreen]
class ScholarshipRoute extends _i22.PageRouteInfo<void> {
  const ScholarshipRoute({List<_i22.PageRouteInfo>? children})
      : super(
          ScholarshipRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScholarshipRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i19.SettingScreen]
class SettingRoute extends _i22.PageRouteInfo<void> {
  const SettingRoute({List<_i22.PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i20.SplashScreen]
class SplashRoute extends _i22.PageRouteInfo<void> {
  const SplashRoute({List<_i22.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}

/// generated route for
/// [_i21.SuggestionScreen]
class SuggestionRoute extends _i22.PageRouteInfo<void> {
  const SuggestionRoute({List<_i22.PageRouteInfo>? children})
      : super(
          SuggestionRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuggestionRoute';

  static const _i22.PageInfo<void> page = _i22.PageInfo<void>(name);
}
