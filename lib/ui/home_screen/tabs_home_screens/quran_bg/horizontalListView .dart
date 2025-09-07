import 'package:flutter/material.dart';
import 'package:islami_app_flutter/utlis/app_colors .dart';
import 'package:islami_app_flutter/utlis/app_assets .dart';
import 'package:islami_app_flutter/utlis/app_text .dart';

class Horizontallistview  extends StatelessWidget {
  const Horizontallistview ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(color: AppColors.goldColor,borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Al-Anbiya',style: AppTextStyle.bold24Black,),
              Text('الأنبياء',style: AppTextStyle.bold24Black,),
              Text(' 112 Verses ',style: AppTextStyle.bold14Black,),
            ],
          ),
          Image(image: AssetImage(AppAssets.imgRecent),fit: BoxFit.fill,color: AppColors.blackColor,)
        ],
      ),
    );
  }
}
