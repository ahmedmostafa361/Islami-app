import 'package:flutter/material.dart';
import 'package:islami_app_flutter/ui/home_screen/tabs_home_screens/quran_bg/sura_details/suras_details%20.dart';
// import '../../../../utlis/suras_details .dart';
import '../../../../utlis/app_assets .dart';
import '../../../../utlis/app_text .dart';

class Verticallistview  extends StatelessWidget {
  int index;

   Verticallistview ({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height*0.082,
      // color: Colors.red,
      child: Row(
        children: [
          Stack(alignment: Alignment.center,
            children: [
              Image(image: AssetImage(AppAssets.starImage),),
              Padding(
                padding:  EdgeInsets.only(top:height*0.004 ),
                child: Text('${index+1}',style: AppTextStyle.bold20White,),
              )
            ],
          ),
          SizedBox(width: width*0.06,),
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${SurasDetails.englishQuranSurahs[index]}',style: AppTextStyle.bold20White,),
              Text('${SurasDetails.ayaNumber[index]} Verses',style: AppTextStyle.bold14White,),
            ],
          ),
          Spacer(),
          Text('${SurasDetails.arabicAuranSuras[index]}',style: AppTextStyle.bold20White ,),

        ],
      ),
    );
  }
}
