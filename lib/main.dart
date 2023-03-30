import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_provider/screen/education/view/education_screen.dart';
import 'package:webview_provider/screen/home/provider/home_provider.dart';
import 'package:webview_provider/screen/home/view/home_screen.dart';
import 'package:webview_provider/screen/open/view/open_screen.dart';
import 'package:webview_provider/screen/ott/view/ott_screen.dart';
import 'package:webview_provider/screen/splash/view/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          'home_screen': (context) => HomeScreen(),
          'education_screen': (context) => EducationScreen(),
          'ott_screen': (context) => OttScreen(),
          'open_screen': (context) => OpenScreen(),
        },
      ),
    ),
  );
}
