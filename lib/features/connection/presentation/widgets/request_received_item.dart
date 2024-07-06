import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholariship/features/connection/presentation/manager/reply_request/reply_bloc.dart';
import 'package:scholariship/features/connection/presentation/widgets/connection_profile.dart';

import '../../../../core/config/injection_container.dart';
import '../../domain/entities/connection_received.dart';

class RequestReceivedItem extends StatelessWidget {
  final ConnectionReceived connection;

  const RequestReceivedItem({super.key, required this.connection});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ReplyBloc>(),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ConnectionProfile(
              name: connection.sender.username,
              userId: connection.senderId,
              profileUrl: connection.sender.profile.profilePicture,
              mutualFriends: 5,
            ),
            if (connection.status == "PENDING")
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    height: 35,
                    width: 35,
                    child: InkWell(
                      onTap: () {
                        context.read<ReplyBloc>().add(AcceptRequest(receiverId: connection.senderId));
                      },
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    height: 35,
                    width: 35,
                    child: InkWell(
                      onTap: () {
                        context.read<ReplyBloc>().add(RejectRequest(receiverId: connection.senderId));
                      },
                      child: const Icon(Icons.close),
                    ),
                  ),
                ],
              )
            else if (connection.status == "ACCEPTED")
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
                  child:  const Text("message")
              )
            else
              const Text("Declined"),
          ],
        ),
      ),
    );
  }
}
