import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:torrent_cl/presentation/navigation/screen_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

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
          SettingsRoute.name: 1,
          LogsRoute.name: 2,
        };

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: _calculateTitle(controller.activeIndex),
            actions: [
              // IconButton(
              //   icon: const Icon(Icons.search),
              //   onPressed: () {
              //   },
              // )
              //switch (controller.activeIndex){
              //case 0:
              //}
            ],
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
                  ),
                ),
                ListTile(
                  title: Text(Intl.message('Home')),
                  onTap: () {
                    controller.setActiveIndex(tabs[TrackerListRoute.name]!);
                  },
                ),
                ListTile(
                  title: Text(Intl.message('Settings')),
                  onTap: () {
                    controller.setActiveIndex(tabs[SettingsRoute.name]!);
                  },
                ),
                ListTile(
                  title: Text(Intl.message('Logs')),
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

Widget _calculateTitle(int index) {
  if (index == 1 || index == 2 || index == 3) {
    return SearchWidget();
  }
  return Text('appbar');
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
       SizedBox(
              width: size.width * 0.7,
              child: TextField(
              decoration: InputDecoration(hintText: 'Search'),
            ),
        ),
        Icon(Icons.search),
      ],
    );
  }
}

