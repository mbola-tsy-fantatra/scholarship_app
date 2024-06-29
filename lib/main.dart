import 'package:flutter/material.dart';
import 'package:scholariship/core/services/websocket_manager.dart';
import 'core/config/injection_container.dart' as di;
import 'core/routes/router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await  di.init();
  await di.sl<SocketManager>().connect('${dotenv.env['SOCKET_URL']}');
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
