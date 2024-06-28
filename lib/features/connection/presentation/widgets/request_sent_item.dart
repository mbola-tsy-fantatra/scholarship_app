import 'package:flutter/material.dart';

import '../../domain/entities/connection_sender.dart';

class RequestSentItem extends StatelessWidget {

  final ConnectionSender? connectionSender;

  const RequestSentItem({super.key, this.connectionSender});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
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
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.purple, // Background color
                foregroundColor: Colors.white, // Text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
              ),
                onPressed: (){},
                child:  const Text("Cancel")
            )
          ],
        ),
    );
  }
}
