import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:googlecloneapp/colors.dart';

import '../web/search_buttons.dart';
import '../web/web_footer.dart';
import '../widgets/search.dart';
import '../widgets/translation_buttons.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        actions: [
          TextButton(onPressed: (){}, 
          child: Text("Gmail",
          style: TextStyle(
            color: primaryColor,fontWeight: FontWeight.w400
          ),
          ),
          ),
        
          TextButton(onPressed: (){}, 
          child: Text("Images",
          style: TextStyle(
            color: primaryColor,fontWeight: FontWeight.w400
          ),
          ),
          ),

          SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('asset/images/more-apps.svg',color: primaryColor,)),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0).copyWith(
              right: 10,
            ),
            child: MaterialButton(
              onPressed: () {},
              color: Color(0xff1A73EB),
              child: Text(
                'Sign in',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5,right: 5),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.25,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children:  [
                    Search(),

        SizedBox(height: 20,),
                   SearchButtons(),
          SizedBox(height: 20,
          ),
                   TranslationButtons(),
                  ],
                ),
                WebFooter(),
              ],
            ))
        ],
      ),
        ),
    );
  }
}