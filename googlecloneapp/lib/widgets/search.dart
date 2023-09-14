import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:googlecloneapp/colors.dart';

import '../screens/search_screen.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return  SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('asset/images/google-logo.png',height: size.height*0.12,),
          ),
          SizedBox(height: 20,),
          SizedBox(
            width: size.width > 768 ? size.width*0.4 : size.width *0.9,
            child: TextFormField(
              onFieldSubmitted: (query){
                Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SearchScreen(
                                searchQuery: query,
                                start: '0',
                              ),
                            ),
                          );
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: searchBorder,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30,),),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('asset/images/search-icon.svg',color: searchBorder,),
                ),
                suffixIcon:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('asset/images/mic-icon.svg'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}