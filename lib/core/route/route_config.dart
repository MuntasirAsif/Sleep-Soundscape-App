import 'package:go_router/go_router.dart';
import 'package:soundscape/src/alarm_screen/alarm_screen.dart';
import 'package:soundscape/src/award_screen/award_screen.dart';
import 'package:soundscape/src/features/create_screen/create_screen.dart';
import 'package:soundscape/src/features/home_screen/home_screen.dart';
import 'package:soundscape/src/features/library_screen/library_screen.dart';
import 'package:soundscape/src/common_widgets/bottom_bar_widget.dart';

class RouteConfig {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => BottomBarWidget(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [GoRoute(path: '/', builder: (context, state) => const HomeScreen())],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: '/library', builder: (context, state) => const LibraryScreen())],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: '/create', builder: (context, state) => const CreateScreen())],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: '/alarm', builder: (context, state) => const AlarmScreen())],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: '/award', builder: (context, state) => const AwardScreen())],
          ),
        ],
      ),
    ],
  );
}
