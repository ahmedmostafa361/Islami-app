import 'package:flutter/material.dart';

import '../../../../../utlis/app_assets .dart';
import '../../../../../utlis/app_colors .dart';
import '../../../../../utlis/app_text .dart';
import '../sura_details/suras_details .dart';

class HorizontallistItem extends StatelessWidget {
  int index;

  HorizontallistItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors.goldColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${SurasDetails.englishQuranSurahs[index]}',
                style: AppTextStyle.bold24Black,
              ),
              Text(
                '${SurasDetails.arabicAuranSuras[index]}',
                style: AppTextStyle.bold24Black,
              ),
              Text(
                '${SurasDetails.ayaNumber[index]} Verses',
                style: AppTextStyle.bold14Black,
              ),
            ],
          ),
          Image(
            image: AssetImage(AppAssets.imgRecent),
            fit: BoxFit.fill,
            color: AppColors.blackColor,
          ),
        ],
      ),
    );
  }
}
