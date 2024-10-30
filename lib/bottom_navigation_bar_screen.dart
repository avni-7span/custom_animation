import 'package:auto_route/auto_route.dart';
import 'package:custom_animations/router/router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AutoTabsRouter(
        homeIndex: 0,
        routes: const [
          HomeRoute(),
          ProfileRoute(),
          SettingsRoute(),
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                tabsRouter.setActiveIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                    label: 'Home',
                    icon: Icon(
                      Icons.home_filled,
                      size: 30,
                      color: Colors.pink.withOpacity(0.6),
                    )),
                BottomNavigationBarItem(
                    label: 'Profile',
                    icon: Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.orange.withOpacity(0.6),
                    )),
                BottomNavigationBarItem(
                    label: 'Settings',
                    icon: Icon(
                      Icons.settings,
                      size: 30,
                      color: Colors.blue.withOpacity(0.6),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
