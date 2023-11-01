import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promolider_app/config/router/app_router.dart';
import 'package:promolider_app/config/theme/app_theme.dart';
import 'package:promolider_app/utils/providers/providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //designSize: const Size(360.0, 690.0),
      builder: (_, __) => MaterialApp.router(
        title: 'Promolíder CMR',
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.appRouter,
        theme: AppTheme.darkTheme,
      ),
    );
  }
}
