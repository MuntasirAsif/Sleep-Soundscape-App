import 'package:go_router/go_router.dart';
import 'package:soundscape/core/route/route_constant.dart';
import '../../src/common_widgets/bottom_bar_widget.dart';
import '../../src/features/view/alarm_screen/alarm_screen.dart';
import '../../src/features/view/award_screen/award_screen.dart';
import '../../src/features/view/create_screen/create_screen.dart';
import '../../src/features/view/home_screen/home_screen.dart';
import '../../src/features/view/library_screen/library_screen.dart';

class RouteConfig {
  static final GoRouter router = GoRouter(
    initialLocation: RouteConstant.initialRoute,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => BottomBarWidget(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [GoRoute(path: RouteConstant.initialRoute, builder: (context, state) => const HomeScreen())],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: RouteConstant.library, builder: (context, state) => const LibraryScreen())],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: RouteConstant.create, builder: (context, state) => const CreateScreen())],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: RouteConstant.alarm, builder: (context, state) => const AlarmScreen())],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: RouteConstant.award, builder: (context, state) => const AwardScreen())],
          ),
        ],
      ),
    ],
  );
}
