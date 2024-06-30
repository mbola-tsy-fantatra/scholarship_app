import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scholariship/features/connection/presentation/widgets/connection_profile.dart';

import '../../domain/entities/connection_received.dart';

class RequestReceivedItem extends StatelessWidget {

  final ConnectionReceived connection;

  const RequestReceivedItem({super.key,required this.connection});


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          ConnectionProfile(name: connection.sender.username, userId: connection.senderId, mutualFriends: 5,),
           Row(
             children: [
               Container(
                 decoration:  BoxDecoration(
                   color: Colors.purple,
                     border: Border.all(
                       color: Colors.black,
                       width: 1.0,
                     ),
                     borderRadius: BorderRadius.circular(35.0),
                 ),
                 height: 35,
                 width: 35,
                 child:  const InkWell(
                   child: Icon(Icons.check,color: Colors.white,),
                 ),
               ),
               const SizedBox(width: 10,),
               Container(
                 decoration:  BoxDecoration(
                   border: Border.all(
                     color: Colors.black,
                     width: 1.0,
                   ),
                   borderRadius: BorderRadius.circular(35.0),
                 ),
                 height: 35,
                 width: 35,
                 child:  const InkWell(
                   child: Icon(Icons.close),
                 ),
               )
             ],
           )
          ],
        )
    );
  }
}
