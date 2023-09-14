import 'package:flutter/material.dart';
import 'package:googlecloneapp/colors.dart';
import 'package:googlecloneapp/widgets/footer_text.dart';

class WebFooter extends StatelessWidget {
  const WebFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: footerColor,
      child: Padding(padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              FooterText(title: 'About'),
              SizedBox(width: 10,),
              FooterText(title: 'Advertising'),
              SizedBox(width: 10,),
              FooterText(title: 'Business'),
              SizedBox(width: 10,),
              FooterText(title: 'How search Works'),
              SizedBox(width: 10,),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              FooterText(title: 'Privacy'),
              SizedBox(width: 10,),
              FooterText(title: 'Terms'),
              SizedBox(width: 10,),
              FooterText(title: 'Settings'),
              SizedBox(width: 10,),
            ],
          ),
        ],
      ),
      ),
    );
  }
}