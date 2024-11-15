import 'package:flutter/material.dart';
import 'package:flutterdemo/views/authentication/account_setup_screen.dart';
import 'package:flutterdemo/views/authentication/login_screen.dart';
import 'package:flutterdemo/views/authentication/profile_form.dart';
import 'package:flutterdemo/views/authentication/request_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AccountScreen(),
      );
    });
  }
}
