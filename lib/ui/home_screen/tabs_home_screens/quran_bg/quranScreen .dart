import 'package:flutter/material.dart';
import 'package:islami_app_flutter/ui/home_screen/tabs_home_screens/quran_bg/horizontalListView%20.dart';
import 'package:islami_app_flutter/ui/home_screen/tabs_home_screens/quran_bg/sura_details/suras_details%20.dart';
import 'package:islami_app_flutter/ui/home_screen/tabs_home_screens/quran_bg/verticalListView%20.dart';
import 'package:islami_app_flutter/utlis/app_assets%20.dart';
import 'package:islami_app_flutter/utlis/app_colors%20.dart';
import 'package:islami_app_flutter/utlis/app_routes%20.dart';
import 'package:islami_app_flutter/utlis/app_text%20.dart';
class Quranscreen extends StatelessWidget {
  const Quranscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width*0.068),
      child: Column( crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(cursorColor: AppColors.whiteColor,
            decoration: InputDecoration(
              prefixIcon: Image(image: AssetImage(AppAssets.iconQuran),color: AppColors.goldColor),
              hintText: 'sura name',
              hintStyle: AppTextStyle.bold16White,
              enabledBorder: textFieldBorder(),
              focusedBorder: textFieldBorder()
            )
            ),
          SizedBox(height: height*0.015,),
          Text('Most Recently',style: AppTextStyle.bold16White,),
          SizedBox(height: height*0.015,),
           Container(
             // color: Colors.deepPurple,
             height: height*0.16,
             width: 100,
             child: ListView.separated(
               scrollDirection: Axis.horizontal,
                 itemBuilder: (context, index) {
                   return Horizontallistview();
                 },
                 separatorBuilder: (context, index) {
                   return Divider(height: 1,color: Colors.red,thickness: 5,);
                 },
                 itemCount: 8),
           ),
          SizedBox(height: height*0.015,),
          Text('Suras List',style: AppTextStyle.bold16White,),
          SizedBox(height: height*0.014,),
          Expanded(
            child: Container(
              // color: Colors.green,
              child: ListView.separated(
                  padding: EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    return InkWell(onTap: () {
                          Navigator.of(context).pushNamed(AppRoutes.suraScreenRoute,arguments: index);
                    },
                        child: Verticallistview(index: index,));
                  },
                  separatorBuilder:(context, index) {
                    return Divider(color: Colors.white,height: 2,thickness: 1,endIndent: width*0.11,indent: width*0.11,);
                  },
                  itemCount: SurasDetails.arabicAuranSuras.length),
            ),
          )
        ],
      ),
    );
  }



  OutlineInputBorder textFieldBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.goldColor ),
    );
  }
}
