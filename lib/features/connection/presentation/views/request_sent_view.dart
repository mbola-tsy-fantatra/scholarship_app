import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scholariship/features/connection/presentation/widgets/request_sent_item.dart';


@RoutePage()
class RequestSentScreen extends StatelessWidget {
  const RequestSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.router.back();
          },
        ),
        title: const Text('Request sent'),
      ),
      body: const Column(
        children: [
          RequestSentItem()
        ],
      ),
    );
  }
}
