import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/routs_manager.dart';
import '../resources/theme_manager.dart';

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true, // prevents text from getting too small
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(theme: getApplicationTheme(),
          debugShowCheckedModeBanner: false,
          routerConfig: RoutsManager().goRouter,
        );
      },
    );
  }
}
