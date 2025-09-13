import 'package:flutter/material.dart';
import 'package:islami_app_flutter/ui/home_screen/tabs_home_screens/hadeth_bg/hadeth_model%20.dart';

import '../../../../utlis/app_assets .dart';
import '../../../../utlis/app_colors .dart';
import '../../../../utlis/app_text .dart';

class HadethItemSecondForm extends StatelessWidget {
  HadethItemSecondForm({super.key});

  @override
  Widget build(BuildContext context) {
    HadethModel hadeth =
        ModalRoute.of(context)!.settings.arguments as HadethModel;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(title: Text(hadeth.title)),
      body: Stack(
        children: [
          Image(
            image: AssetImage(AppAssets.suraBg),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.03,
            ),
            child: Column(
              children: [
                Text(hadeth.title, style: AppTextStyle.bold24Gold),
                SizedBox(height: height * 0.05),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      return Text(
                        hadeth.content,
                        style: AppTextStyle.bold20Gold,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                      );
                    },
                    itemCount: 1,
                    shrinkWrap: true,
                  ),
                ),
                SizedBox(height: height * 0.115),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Expanded(
// child: ListView.builder(padding: EdgeInsets.only(top: 1),
// itemBuilder: (context, index) {
// return Text(" ", style: AppTextStyle.bold20Gold,
// textDirection: TextDirection.rtl,
// textAlign: TextAlign.center,);
// },
// itemCount: 1,
// shrinkWrap: true,),
// );
