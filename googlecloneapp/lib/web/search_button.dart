import 'package:flutter/material.dart';
import 'package:googlecloneapp/colors.dart';

class SearchButton extends StatelessWidget {
  final String title;

  const SearchButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 25 ,vertical: 18),
      color: searchColor,
      child: Text(title),
      onPressed: () {
        
      },
    );
  }
}
