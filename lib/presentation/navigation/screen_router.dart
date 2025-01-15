import 'package:auto_route/auto_route.dart';

import 'package:torrent_cl/presentation/screens/home/home_screen.dart';
import 'package:torrent_cl/presentation/screens/logs/logs_screen.dart';
import 'package:torrent_cl/presentation/screens/settings/settings_screen.dart';
import 'package:torrent_cl/presentation/screens/tracker_list/tracker_list_screen.dart';

part 'screen_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          children: [
            AutoRoute(page: TrackerListRoute.page),
            AutoRoute(page: SettingsRoute.page),
            AutoRoute(page: LogsRoute.page),
          ],
        ),
      ];
}
