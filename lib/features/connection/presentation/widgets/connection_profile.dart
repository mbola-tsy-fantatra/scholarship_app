import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ConnectionProfile extends StatelessWidget {
  final String name;
  final int? mutualFriends;
  final String userId;
  final String? profileId;
  final String? profileUrl;

  const ConnectionProfile({super.key, this.profileUrl, required this.name, this.mutualFriends, required this.userId,this.profileId});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 55,
          width: 55,
          child: InkWell(
            onTap: () {
              print('profileId-Conneciton profile : $profileId');
              context.router.pushNamed('/profile/$profileId');
            },
            child: CircleAvatar(
              backgroundImage: profileUrl != null
                  ? const AssetImage('assets/honami.jpg')
                  : const AssetImage('assets/honami.jpg') as ImageProvider,
              onBackgroundImageError: (_, __) => const Icon(Icons.error),
              child: profileUrl == null
                  ? const Icon(Icons.person)
                  : null,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 5),
            Text(
              "$mutualFriends mutual friends",
              style: TextStyle(color: Colors.black.withOpacity(0.7)),
            ),
          ],
        ),
      ],
    );
  }
}
