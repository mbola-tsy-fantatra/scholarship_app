import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scholariship/core/routes/router.gr.dart';

@RoutePage()
class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: false,
              floating: true,
              snap: true,
              elevation: 4,
              backgroundColor: Colors.white,
              title: const Text('Scholarship'),
              centerTitle: false,
              actions: <Widget>[
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/honami.jpg"),

                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                      context.router.push(const SettingRoute());
                  },
                ),
              ],
            ),
          ];
        },
        body: AutoTabsRouter(
          routes: const [
            HomeRoute(),
            ScholarshipRoute(),
            ConnectionRoute(),
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
                  BottomNavigationBarItem(
                    label: 'Connection',
                    icon: Icon(Icons.people),
                  ),
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
        ),
      ),
    );
  }
}
