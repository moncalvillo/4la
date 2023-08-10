import 'package:app/config/themes/app_theme.dart';
import 'package:app/shared/providers/session_provider.dart';
import 'package:app/shared/router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SessionProvider()),
      ],
      child: MaterialApp.router(
        title: "4la",
        debugShowCheckedModeBanner: false,
        theme: AppTheme(color: 12).getTheme(),
        routerConfig: appRouter,
      ),
    );
  }
}
