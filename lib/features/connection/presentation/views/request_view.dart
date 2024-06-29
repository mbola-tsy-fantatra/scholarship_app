import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholariship/features/connection/presentation/manager/connection_request/connection_request_bloc.dart';
import 'package:scholariship/features/connection/presentation/widgets/request_received_item.dart';

import '../../../../core/config/injection_container.dart';

@RoutePage()
class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

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
        title: const Text('Request'),
      ),
      body: BlocProvider(
        create: (context)=> sl<ConnectionRequestBloc>(),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              RequestReceivedItem()
            ],
          ),
        ),
      )
    );
  }
}
