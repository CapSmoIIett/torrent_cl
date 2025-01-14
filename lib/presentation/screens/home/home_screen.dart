import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:torrent_cl/presentation/navigation/screen_router.dart';


@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      homeIndex: 0,
      routes: [
        TrackerListRoute(),
        SettingsRoute(),
        LogsRoute(),
      ],

      builder: (context, child) {
        final controller = AutoTabsRouter.of(context);

        final tabs = {
          TrackerListRoute.name: 0,
          SettingsRoute.name:    1,
          LogsRoute.name:        2, 
        };

        return Scaffold(
          appBar: AppBar(
            title: Text('appbar'),
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                    ),
                    child: Center(
                      child: Text('Torrent'),
                    )),
                ListTile(
                  title: const Text('Home'),
                  onTap: () {
                    controller.setActiveIndex(tabs[TrackerListRoute.name]!);
                  },
                ),
                ListTile(
                  title: const Text('Settings'),
                  onTap: () {
                    controller.setActiveIndex(tabs[SettingsRoute.name]!);
                  },
                ),
                ListTile(
                  title: const Text('Logs'),
                  onTap: () {
                    controller.setActiveIndex(tabs[LogsRoute.name]!);
                  },
                ),
              ],
            ),
          ),
          body: child,
        );
      },
    );
  }
}
