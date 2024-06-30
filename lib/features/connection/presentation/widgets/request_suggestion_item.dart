import 'package:flutter/material.dart';
import 'package:scholariship/features/connection/presentation/widgets/connection_profile.dart';
import '../../domain/entities/user_profile.dart';

class RequestSuggestionItem extends StatelessWidget {

  final UserProfile profile;

  const RequestSuggestionItem({super.key,required this.profile});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ConnectionProfile(name: profile.user.username, userId: profile.user.id, mutualFriends: 5,),
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
              child:  const Text("Send request")
          )
        ],
      ),
    );
  }
}
