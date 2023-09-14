import 'package:flutter/material.dart';
import 'package:googlecloneapp/colors.dart';
import 'package:googlecloneapp/responsive/mobile_screen_layout.dart';
import 'package:googlecloneapp/responsive/responsive_layout_screen.dart';
import 'package:googlecloneapp/responsive/web_screen_layout.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Clone',
      theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: backgroundColor
      ),
      home: const ResponsiveLayoutScreen(
        mobileScreenLayout: MobileScreenLayout(),
        webScreenLayout: WebScreenLayout()
        ),
      
    );
  }
}

