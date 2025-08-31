import 'package:actapp/backend/api.dart';
import 'package:actapp/common/splashscreen.dart';
import 'package:actapp/frontend/auth/login.dart';
import 'package:actapp/frontend/auth/login2.dart';
import 'package:actapp/frontend/auth/otp.dart';
import 'package:actapp/frontend/auth/otpemail.dart';
import 'package:actapp/frontend/filterPage.dart';
import 'package:actapp/frontend/navigation/layout.dart';
import 'package:actapp/frontend/talentProfile.dart';
import 'package:actapp/frontend/talents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,

      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
            fontFamily: API.appfont2,
          ),
        );
      },
      child: const TalentProfile(),
    );
  }
}