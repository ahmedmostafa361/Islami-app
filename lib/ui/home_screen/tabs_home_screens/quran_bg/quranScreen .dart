import 'package:flutter/material.dart';
import 'package:islami_app_flutter/providers/most_recent_provider%20.dart';
import 'package:islami_app_flutter/ui/home_screen/tabs_home_screens/quran_bg/sura_details/suras_details%20.dart';
import 'package:islami_app_flutter/ui/home_screen/tabs_home_screens/quran_bg/verticalListView%20.dart';
import 'package:provider/provider.dart';

import '../../../../utlis/app_assets .dart';
import '../../../../utlis/app_colors .dart';
import '../../../../utlis/app_routes .dart';
import '../../../../utlis/app_text .dart';
import '../../../../utlis/shared_preferences_helper .dart';
import 'most_recent_widget/most_recently_widget .dart';

class Quranscreen extends StatefulWidget {
  const Quranscreen({super.key});

  @override
  State<Quranscreen> createState() => _QuranscreenState();
}

class _QuranscreenState extends State<Quranscreen> {
  List<int> filterList = List.generate(114, (index) => index);
  List<int> mostRecentList = [];
  late MostRecentProvider mostRecentProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mostRecentProvider.readLastSuraList();
    },);
  }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.068),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            cursorColor: AppColors.whiteColor,
            decoration: InputDecoration(
              prefixIcon: Image(
                image: AssetImage(AppAssets.iconQuran),
                color: AppColors.goldColor,
              ),
              hintText: 'sura name',
              hintStyle: AppTextStyle.bold16White,
              enabledBorder: textFieldBorder(),
              focusedBorder: textFieldBorder(),
            ),
            style: const TextStyle(color: AppColors.whiteColor),
            onChanged: (newText) {
              searchResultText(newText);
            },
          ),
          SizedBox(height: height * 0.015),
          MostRecentlyWidget(mostRecentList: mostRecentProvider.mostRecentList),
          SizedBox(height: height * 0.015),
          Text('Suras List', style: AppTextStyle.bold16White),
          SizedBox(height: height * 0.014),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    saveLastSuraIndex(filterList[index]).then((_) {
                      mostRecentProvider.readLastSuraList();
                    });
                    Navigator.of(context).pushNamed(
                      AppRoutes.suraScreenRoute,
                      arguments: filterList[index],
                    );
                  },
                  child: Verticallistview(index: filterList[index]),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.white,
                  height: 2,
                  thickness: 1,
                  endIndent: width * 0.11,
                  indent: width * 0.11,
                );
              },
              itemCount: filterList.length,
            ),
          )
        ],
      ),
    );
  }

  OutlineInputBorder textFieldBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.goldColor),
    );
  }

  void searchResultText(String newText) {
    List<int> searchReasultList = [];
    for (int i = 0; i < SurasDetails.englishQuranSurahs.length; i++) {
      if (SurasDetails.englishQuranSurahs[i]
          .toLowerCase()
          .contains(newText.toLowerCase())) {
        searchReasultList.add(i);
      }
    }
    for (int i = 0; i < SurasDetails.arabicAuranSuras.length; i++) {
      if (SurasDetails.arabicAuranSuras[i]
          .toLowerCase()
          .contains(newText.toLowerCase())) {
        searchReasultList.add(i);
      }
    }
    filterList = searchReasultList;
    setState(() {});
  }
}
