import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scholariship/features/connection/presentation/widgets/request_received_item.dart';

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
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            RequestReceivedItem()
          ],
        ),
      )
    );
  }
}
