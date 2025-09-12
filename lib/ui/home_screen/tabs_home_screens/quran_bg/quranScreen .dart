import 'package:flutter/material.dart';
import 'package:islami_app_flutter/ui/home_screen/tabs_home_screens/quran_bg/horizontalListView%20.dart';
import 'package:islami_app_flutter/ui/home_screen/tabs_home_screens/quran_bg/sura_details/suras_details%20.dart';
import 'package:islami_app_flutter/ui/home_screen/tabs_home_screens/quran_bg/verticalListView%20.dart';
import 'package:islami_app_flutter/utlis/app_assets%20.dart';
import 'package:islami_app_flutter/utlis/app_colors%20.dart';
import 'package:islami_app_flutter/utlis/app_routes%20.dart';
import 'package:islami_app_flutter/utlis/app_text%20.dart';

class Quranscreen extends StatefulWidget {
  Quranscreen({super.key});

  @override
  State<Quranscreen> createState() => _QuranscreenState();
}

class _QuranscreenState extends State<Quranscreen> {
  List<int> filterList = List.generate(114, (index) => index,);

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

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.068),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(cursorColor: AppColors.whiteColor,
            decoration: InputDecoration(
                prefixIcon: Image(image: AssetImage(AppAssets.iconQuran),
                    color: AppColors.goldColor),
                hintText: 'sura name',
                hintStyle: AppTextStyle.bold16White,
                enabledBorder: textFieldBorder(),
                focusedBorder: textFieldBorder()
            ),
            style: TextStyle(color: AppColors.whiteColor),
            onChanged: (newText) {
              searchResultText(newText);
            },
          ),
          SizedBox(height: height * 0.015,),
          Text('Most Recently', style: AppTextStyle.bold16White,),
          SizedBox(height: height * 0.015,),
          Container(
            // color: Colors.deepPurple,
            height: height * 0.16,
            width: 100,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Horizontallistview();
                },
                separatorBuilder: (context, index) {
                  return Divider(height: 1, color: Colors.red, thickness: 5,);
                },
                itemCount: 8),
          ),
          SizedBox(height: height * 0.015,),
          Text('Suras List', style: AppTextStyle.bold16White,),
          SizedBox(height: height * 0.014,),
          Expanded(child: ListView.separated(
            padding: EdgeInsets.all(0),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(
                    context,
                  ).pushNamed(
                      AppRoutes.suraScreenRoute, arguments: filterList[index]);
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
      borderSide: BorderSide(color: AppColors.goldColor),
    );
  }

  void searchResultText(String newText) {
    List<int> searchReasultList = [];
    for (int i = 0; i < SurasDetails.englishQuranSurahs.length; i++) {
      if (SurasDetails.englishQuranSurahs[i].toLowerCase().contains(
          newText.toLowerCase())) {
        searchReasultList.add(i);
      }
    }
    for (int i = 0; i < SurasDetails.arabicAuranSuras.length; i++) {
      if (SurasDetails.arabicAuranSuras[i].toLowerCase().contains(
          newText.toLowerCase())) {
        searchReasultList.add(i);
      }
    }
    filterList = searchReasultList;
    setState(() {

    });
  }
}

