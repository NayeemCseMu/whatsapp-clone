import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'presentation/core/routes/routes_name.dart';
import 'utils/strings.dart';
import 'widgets/custom_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375.0, 812.0),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (BuildContext context, child) {
        return MaterialApp(
          title: KStrings.appName,
          debugShowCheckedModeBanner: false,
          initialRoute: RouteNames.splashScreen,
          onGenerateRoute: RouteNames.generateRoutes,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },
          theme: MyTheme.theme,
        );
      },
    );
  }
}
