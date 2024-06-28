import 'package:flutter/material.dart';

import '../../domain/entities/connnection_item.dart';

class ConnectionItemWidget extends StatelessWidget {

  final ConnectionItem connectionItem;

  const ConnectionItemWidget({super.key,required this.connectionItem});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/honami.jpg"),
        ),
        Text("Yor Forger")
      ],
    );
  }
}
