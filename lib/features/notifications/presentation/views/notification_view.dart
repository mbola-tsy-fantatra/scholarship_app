import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholariship/core/routes/router.gr.dart';
import '../../../../core/config/injection_container.dart';
import '../../domain/entities/Notification.dart';
import '../manager/notification_bloc.dart';

@RoutePage()
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        'profilePic': 'assets/profile1.jpg',
        'title': 'New friend request',
        'message': 'John Doe sent you a friend request.',
        'timestamp': '2h ago'
      },
      {
        'profilePic': 'assets/profile2.jpg',
        'title': 'New comment',
        'message': 'Jane Smith commented on your post.',
        'timestamp': '3h ago'
      },
      {
        'profilePic': 'assets/profile3.jpg',
        'title': 'New like',
        'message': 'Michael Johnson liked your photo.',
        'timestamp': '5h ago'
      },
      {
        'profilePic': 'assets/profile4.jpg',
        'title': 'New message',
        'message': 'Emily Davis sent you a message.',
        'timestamp': '1d ago'
      },
      {
        'profilePic': 'assets/profile5.jpg',
        'title': 'New follow',
        'message': 'David Wilson started following you.',
        'timestamp': '2d ago'
      },
    ];
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<NotificationBloc>()..add(GetNotificationEvent()),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<NotificationBloc, NotificationState>(
            builder: (context, state) {
              if (state is Loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is Loaded) {
                return ListView.builder(
                  itemCount: state.notifications?.length ?? 0,
                  itemBuilder: (context, index) {
                    final notification = state.notifications![index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(notification.from.profile.profilePicture),
                      ),
                      title: Text(
                        notification.type,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: notification.isRead ? Colors.grey : Colors.black,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(notification.content),
                          const SizedBox(height: 4),
                          Text(
                            notification.createdAt.toString(),
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      isThreeLine: true,
                      onTap: () {
                        _handleNotificationTap(context, notification);
                      },
                    );
                  },
                );
              } else if (state is ErrorState) {
                return ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final notification = notifications[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(notification['profilePic']!),
                      ),
                      title: Text(
                        notification['title']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(notification['message']!),
                          const SizedBox(height: 4),
                          Text(
                            notification['timestamp']!,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      isThreeLine: true,
                      onTap: () {
                        // Handle notification tap if needed
                      },
                    );
                  },
                );
              } else {
                return const Center(child: Text('No notifications available.'));
              }
            },
          ),
        ),
      ),
    );
  }

  void _handleNotificationTap(BuildContext context, Notifications notification) {
    switch (notification.type) {
      case 'request':
        AutoRouter.of(context).push(const RequestRoute());
        break;
      case 'comment':
        AutoRouter.of(context).push(const RequestRoute());
        break;
      case 'like':
        AutoRouter.of(context).push(const RequestRoute());
        break;
      case 'message':
        AutoRouter.of(context).push(const RequestRoute());
        break;
      case 'follow':
        AutoRouter.of(context).push(const RequestRoute());
        break;
      default:
        break;
    }
  }
}
