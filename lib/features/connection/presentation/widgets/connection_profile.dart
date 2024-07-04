import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ConnectionProfile extends StatelessWidget {
  final String name;
  final int? mutualFriends;
  final String userId;
  final String? profileUrl;

  const ConnectionProfile({super.key,this.profileUrl,required this.name,this.mutualFriends,required this.userId});

  @override
  Widget build(BuildContext context) {
  return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 55,
          width: 55,
          child:InkWell(
            onTap: (){
              context.router.pushNamed('/profile/$userId');
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage("assets/honami.jpg"),
            ),
          ) ,
        ),
        const SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,style: const TextStyle(fontSize: 17),),
            const SizedBox(height: 5,),
            Text("10 mutual friends",style: TextStyle(color: Colors.black.withOpacity(0.7)),)
          ],
        )
      ],
    );
  }
}
