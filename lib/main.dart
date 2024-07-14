import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scholariship/core/services/websocket_manager.dart';
import 'package:scholariship/features/onboarding_profile/reposirtory/academics_provider.dart';
import 'package:scholariship/features/onboarding_profile/reposirtory/profile_provider.dart';
import 'package:scholariship/features/onboarding_profile/reposirtory/profile_repository.dart';
import 'core/config/injection_container.dart' as di;
import 'core/routes/router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await di.init();
  await di.sl<SocketManager>().connect('${dotenv.env['SOCKET_URL']}', null);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ProfileProvider>(
          create: (_) => ProfileProvider(
            repository: di.sl<OnboardingProfileRepository>(),
          ),
        ),
        ChangeNotifierProvider<AcademicsProvider>(
          create: (_) => AcademicsProvider(
              repository: di.sl<OnboardingProfileRepository>()),
        ),
        ChangeNotifierProvider<CountryProvider>(
          create: (_) =>
              CountryProvider(repository: di.sl<OnboardingProfileRepository>()),
        ),
        ChangeNotifierProvider<StudyLevelProvider>(
          create: (_) => StudyLevelProvider(
              repository: di.sl<OnboardingProfileRepository>()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
