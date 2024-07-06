import 'package:flutter/material.dart';

import '../../domain/entities/connection_sender.dart';
import 'connection_profile.dart';

class RequestSentItem extends StatelessWidget {

  final ConnectionSender connectionSender;

  const RequestSentItem({super.key,required this.connectionSender});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ConnectionProfile(
              name: connectionSender.receiver.username,
              userId: "1",
              mutualFriends: 5,
              profileUrl: connectionSender.receiver.profile.profilePicture,
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
