import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scholariship/core/routes/router.gr.dart';

@RoutePage()
class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        ScholarshipRoute(),
        // ProfileRoute(),
        MessageRoute(),
        NotificationRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 24,
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Scholarship',
                icon: Icon(Icons.book),
              ),
              // BottomNavigationBarItem(
              //   label: 'Profile',
              //   icon: Icon(Icons.account_circle),
              // ),
              BottomNavigationBarItem(
                label: 'Messages',
                icon: Icon(Icons.message),
              ),
              BottomNavigationBarItem(
                label: 'Notifications',
                icon: Icon(Icons.notifications),
              ),
            ],
          ),
        );
      },
    );
  }
}
