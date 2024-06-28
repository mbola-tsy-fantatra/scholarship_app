import 'package:flutter/material.dart';

import '../../domain/entities/connnection_item.dart';

class ConnectionItemWidget extends StatelessWidget {

  final ConnectionItem? connectionItem;

  const ConnectionItemWidget({super.key, this.connectionItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 55,
                  width: 55,
                  child:InkWell(
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/honami.jpg"),
                    ),
                  ) ,
                ),
                const SizedBox(width: 10,),
                Column(
                  children: [
                    const Text("Mitsuri kanroji",style: TextStyle(fontSize: 17),),
                    const SizedBox(height: 5,),
                    Text("10 mutual friends",style: TextStyle(color: Colors.black.withOpacity(0.7)),)
                  ],
                )
              ],
            ),
            const InkWell(
              child: Icon(Icons.more_horiz_outlined),
            )
          ],
        )
    );
  }
}
