// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:googlecloneapp/responsive/web_screen_layout.dart';

class ResponsiveLayoutScreen extends StatelessWidget {
  final Widget mobileScreenLayout;
  final Widget webScreenLayout;

  const ResponsiveLayoutScreen({
    Key? key,
    required this.mobileScreenLayout,
    required this.webScreenLayout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(
    builder: (context ,constraints){
   if(constraints.maxWidth <= 768){
        return mobileScreenLayout;
   }
       return WebScreenLayout();
    },
    );
  }
}
