import 'package:flutter/material.dart';
import 'package:islami_app_flutter/utlis/app_text%20.dart';

import '../../../../utlis/app_colors .dart';

class AzkarItem extends StatelessWidget {
  const AzkarItem({super.key, required this.text, required this.img});

  final String text;
  final String img;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blackColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 2, color: AppColors.goldColor),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              margin: EdgeInsets.only(top: height * 0.015),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(
                top: height * 0.01,
                bottom: height * 0.01,
              ),
              child: Text(text, style: AppTextStyle.bold20White),
            ),
          ),
        ],
      ),
    );
  }
}
