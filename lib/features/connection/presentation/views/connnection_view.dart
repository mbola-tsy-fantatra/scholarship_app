import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholariship/features/connection/domain/entities/connnection_item.dart';
import 'package:scholariship/features/connection/presentation/index.dart';

import '../../../../core/config/injection_container.dart';

@RoutePage()
class ConnectionScreen extends StatelessWidget {
  const ConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context)=> sl<ConnectionBloc>(),
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              pinned: true,
              title: Text('Connections'),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [

                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
