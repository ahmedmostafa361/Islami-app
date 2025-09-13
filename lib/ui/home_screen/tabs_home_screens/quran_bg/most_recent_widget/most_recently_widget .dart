import 'package:flutter/material.dart';
import 'package:islami_app_flutter/ui/home_screen/tabs_home_screens/quran_bg/most_recent_widget/horizontallist_item.dart';

import '../../../../../utlis/app_text .dart';

class MostRecentlyWidget extends StatelessWidget {
  final List<int> mostRecentList;

  const MostRecentlyWidget({super.key, required this.mostRecentList});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Visibility(
      visible: mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Most Recently', style: AppTextStyle.bold16White),
          SizedBox(height: height * 0.015),
          Container(
            height: height * 0.16,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return HorizontallistItem(index: mostRecentList[index]);
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: mostRecentList.length,
            ),
          ),
        ],
      ),
    );
  }
}
