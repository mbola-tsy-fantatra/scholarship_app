import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:scholariship/core/usecases/usecase.dart';
import 'package:scholariship/features/auth/domain/usecases/logout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/config/injection_container.dart';
import 'package:scholariship/global/error/failure.dart';

import '../../../../core/routes/router.gr.dart';

@RoutePage()
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  Future<void> _logout(BuildContext context) async {
    final Logout logout = Logout(sharedPreferences: sl<SharedPreferences>());
    final Either<Failure, bool>? result = await logout(NoParams());

    result?.fold(
          (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Échec de la déconnexion')),
        );
      },
          (success) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Déconnexion réussie')),
          );
          context.router.replaceAll([const LoginRoute()]);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.router.back();
          },
        ),
        title: const Text('Setting'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            _logout(context);
          },
          child: const Text("Logout"),
        ),
      ),
    );
  }
}
