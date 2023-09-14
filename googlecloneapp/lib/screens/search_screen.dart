import 'package:flutter/material.dart';
import 'package:googlecloneapp/colors.dart';
import 'package:googlecloneapp/services/api_services.dart';

import '../widgets/Search_tabs.dart';
import '../widgets/search_footer.dart';
import '../widgets/search_header.dart';
import '../widgets/search_result_component.dart';

class SearchScreen extends StatelessWidget {
  final String searchQuery;
  final String start;
  const SearchScreen({
    Key? key,
    required this.searchQuery,
    required this.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;

    return Title(
      color: Colors.blue,
      title: searchQuery,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //web header
              const SearchHeader(),
              //tab for news images
               Padding(
                padding: EdgeInsets.only(left: size.width <= 768 ? 10: 150.0),
                child:const SingleChildScrollView(scrollDirection: Axis.horizontal,
                  child:  SearchTabs(),
                  ),
              ),
             const Divider(
                height: 0,
                thickness: 0.3,
              ),
              //search results
              FutureBuilder(
                  future: ApiService().fetchData(queryTerm: searchQuery, start: start),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
          

                          Column(
                            children: [
                              ListView.builder(
                                itemCount: snapshot.data?['items'].length,
                                shrinkWrap: true,
                                itemBuilder: (context , index){
                                return Column(
                                  children: [
                                       Container(
                                padding: EdgeInsets.only(left: size.width <= 768 ? 10: 150,
                                 top: 12),
                                child: Text(
                                  'About ${snapshot.data?['searchInformation']['formattedTotalResults']} results (${snapshot.data?['searchInformation']['formattedSearchTime']} seconds)',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff70757a),
                                  ),
                                ),
                              ),

                                    Padding(padding:  EdgeInsets.only(
                                      left: size.width <= 768 ? 10: 150,
                                      top: 10
                                      ),
                                    child: SearchResultComponent(
                                      desc: snapshot.data?['items'] [index]['snippet'],
                                      linkToGo:snapshot.data?['items'] [index]['link'],
                                      link: snapshot.data?['items'] [index]['formattedUrl'],
                                      text: snapshot.data?['items'] [index]['title'],
                                    ),  
                                    ),
                                  ],
                                );
                              },
                              ),
                              
                              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (start != "0") {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SearchScreen(
                                searchQuery: searchQuery,
                                start: (int.parse(start) - 10).toString(),
                              ),
                            ),
                          );
                        }
                      },
                      child: Text(
                        '< Prev',
                        style: TextStyle(
                          fontSize: 15,
                          color: blueColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SearchScreen(
                                searchQuery: searchQuery,
                                start: (int.parse(start) + 10).toString(),
                              ),
                            ),
                          );
                      },
                      child: Text(
                        'Next >',
                        style: TextStyle(
                          fontSize: 15,
                          color: blueColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SearchFooter(),
                            ],
                          ),
                //          
                           
    //
                          // ListView.builder(
                          //   itemCount: snapshot.data?['items'].length,
                          //   shrinkWrap: true,
                          //   itemBuilder: (context , index){
                          //   return Padding(padding:  EdgeInsets.only(
                          //     left: size.width <= 768 ? 10: 150,
                          //     top: 10
                          //     ),
                          //   child: SearchResultComponent(
                          //     desc: snapshot.data?['items'] [index]['snippet'],
                          //     linkToGo:snapshot.data?['items'] [index]['link'],
                          //     link: snapshot.data?['items'] [index]['formattedUrl'],
                          //     text: snapshot.data?['items'] [index]['title'],
                          //   ),  
                          //   );
                          // },
                          // ),
                        ],
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  ),
              
              // SizedBox(
              //   width: double.infinity,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       TextButton(
              //         onPressed: () {
              //           if (start != "0") {
              //             Navigator.of(context).push(
              //               MaterialPageRoute(
              //                 builder: (context) => SearchScreen(
              //                   searchQuery: searchQuery,
              //                   start: (int.parse(start) - 10).toString(),
              //                 ),
              //               ),
              //             );
              //           }
              //         },
              //         child: Text(
              //           '< Prev',
              //           style: TextStyle(
              //             fontSize: 15,
              //             color: blueColor,
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         width: 30,
              //       ),
              //       TextButton(
              //         onPressed: () {
              //           Navigator.of(context).push(
              //               MaterialPageRoute(
              //                 builder: (context) => SearchScreen(
              //                   searchQuery: searchQuery,
              //                   start: (int.parse(start) + 10).toString(),
              //                 ),
              //               ),
              //             );
              //         },
              //         child: Text(
              //           'Next >',
              //           style: TextStyle(
              //             fontSize: 15,
              //             color: blueColor,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 30,
              // ),
              // SearchFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
