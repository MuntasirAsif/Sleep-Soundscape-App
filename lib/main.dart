import 'package:flutter/material.dart';
import 'package:soundscape/src/provider/search_provider.dart';
import 'core/route/route_config.dart';
import 'core/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'src/provider/category_provider.dart';
import 'src/provider/menu_button_provider.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => MenuButtonProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),

      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: RouteConfig.router,
    );
  }
}