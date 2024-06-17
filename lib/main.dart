import 'package:flutter/material.dart';
import 'core/config/injection_container.dart' as di;
import 'core/routes/router.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
