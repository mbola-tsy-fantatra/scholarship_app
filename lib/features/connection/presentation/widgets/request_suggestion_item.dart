import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholariship/features/connection/presentation/manager/send_request/send_request_bloc.dart';
import 'package:scholariship/features/connection/presentation/widgets/connection_profile.dart';
import '../../../../core/config/injection_container.dart';
import '../../data/request/connection_request.dart';
import '../../domain/entities/user_profile.dart';

class RequestSuggestionItem extends StatelessWidget {

  final UserProfile profile;

  const RequestSuggestionItem({super.key,required this.profile});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>sl<SendRequestBloc>(),
      child:Padding(
        padding:const EdgeInsets.all(16),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ConnectionProfile(
              name: profile.user.username,
              userId: profile.user.id,
              profileUrl: profile.profilePicture,
              profileId: profile.id,
              mutualFriends: 5,),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.purple, // Background color
                  foregroundColor: Colors.white, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
                ),
                onPressed: (){
                  sl<SendRequestBloc>().add(SendRequest(connectionRequest: ConnectionRequest(receiverId: profile.userId)));
                },
                child:  BlocBuilder<SendRequestBloc,SendRequestState>(
                  builder: (context,state){
                    if(state is RequestSending){
                      return const Center(child: CircularProgressIndicator());
                    }
                    else if (state is RequestSent){
                      return const Text("Request sent");
                    }
                    else if(state is SendErrorState){
                      print("error");
                      return Center(child: Text('Failed to load scholarships: ${state.message}'));
                    }else{
                      return const Text("connect");
                    }
                  },
                )
            )
          ],
        ),
      )
    );
  }
}
