import 'package:flutter/material.dart';

import '../../../../utlis/app_text .dart';

class TimeScreenItem extends StatelessWidget {
  TimeScreenItem({super.key, required this.index});

  final List<String> prayTime = ['Fagr', 'Dhuhr', 'Asr', 'Maghrib', 'Isha'];
  final List<String> time = ['04:38', '12:00', '03:12', '07:05', '08:10'];
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black87, Colors.black38],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        // color: AppColors.goldColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            prayTime[index],
            textAlign: TextAlign.center,
            style: AppTextStyle.bold16White,
          ),
          Text(
            time[index],
            textAlign: TextAlign.center,
            style: AppTextStyle.bold32White,
          ),
          Text(
            'PM',
            textAlign: TextAlign.center,
            style: AppTextStyle.bold16White,
          ),
        ],
      ),
    );
  }
}
