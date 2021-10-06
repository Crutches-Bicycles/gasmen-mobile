import 'package:flutter/material.dart';
import 'package:gassmen/mainpage.dart';
import 'package:gassmen/try_screen.dart';
import 'package:get/get.dart';
import 'auth_screen.dart';
import 'constans.dart';
import 'detail_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white38,
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.white),
          contentPadding: EdgeInsets.symmetric(
              vertical: defpaultPadding * 1.2, horizontal: defpaultPadding),
        ),
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: ()=>AuthScreen()),
        GetPage(name: "/detail", page: ()=>DetailPage())
      ],
      home: AuthScreen(),
    );
  }
}

