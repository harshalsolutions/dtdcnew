import 'package:flutter/material.dart';

class CategoryContentDisplay extends StatelessWidget {
  final String categoryName;
  final String categoryContent;

  const CategoryContentDisplay(
      {required this.categoryName, required this.categoryContent});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.009),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              minWidth: screenWidth * 0.304,
            ),
            child: Text(
              categoryName + ':',
              style: TextStyle(
                fontFamily: 'PT Sans',
                fontSize: screenHeight * 0.016,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Flexible(
            child: Text(
              categoryContent,
              style: TextStyle(
                fontFamily: 'PT Sans',
                fontSize: screenHeight * 0.016,
                fontWeight: FontWeight.w800,
              ),
            ),
          )
        ],
      ),
    );
  }
}
