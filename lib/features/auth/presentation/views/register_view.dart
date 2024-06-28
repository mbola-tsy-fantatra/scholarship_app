import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholariship/features/auth/presentation/widgets/register_form.dart';

import '../../../../core/config/injection_container.dart';
import '../manager/auth_bloc.dart';


@RoutePage()
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              weight: 2,
            ),
            onPressed: () {},
          ),
          title: Text(
            '',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith( fontSize: 22),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  children: [
                    Text(
                      'Register',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    buildBody(context),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account ?",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            TextButton(
                              onPressed: () {
                                context.router.replaceNamed("/");
                              },
                              child: Text(
                                "Sign in here",
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    decoration: TextDecoration.underline
                                ),
                              ),)
                          ],
                        )
                      ],
                    )

                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
BlocProvider<AuthBloc> buildBody(BuildContext context){
  return
    BlocProvider(create: (context)=> sl<AuthBloc>(),
      child: const RegisterForm(),
    );
}
