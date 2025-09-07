import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_flutter/ui/home_screen/tabs_home_screens/quran_bg/sura_details/first_form_sora_screen%20.dart';
import 'package:islami_app_flutter/ui/home_screen/tabs_home_screens/quran_bg/sura_details/second_form_sora_screen%20.dart';
import 'package:islami_app_flutter/ui/home_screen/tabs_home_screens/quran_bg/sura_details/suras_details%20.dart';
import 'package:islami_app_flutter/utlis/app_assets%20.dart';
import 'package:islami_app_flutter/utlis/app_colors%20.dart';
import 'package:islami_app_flutter/utlis/app_text%20.dart';
class SuraScreen extends StatefulWidget {
  SuraScreen({super.key});
  @override
  State<SuraScreen> createState() => _SuraScreenState();
}
class _SuraScreenState extends State<SuraScreen> {
  List<String> verses =[];
   String connectVerses='';
   bool show =true;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    int index = ModalRoute.of(context)!.settings.arguments as int;
    if(verses.isEmpty){
      suraFile(index);
    }
    return Scaffold(
       backgroundColor: AppColors.bgColor,
      appBar: AppBar(
       title: Text('${SurasDetails.englishQuranSurahs[index]}'),
        actions: [
          InkWell(onTap: () {
                  show =!show;
                  setState(() {
                  });
          },child: Icon(Icons.change_circle,))
       ,SizedBox(width: width*0.05,) ],
      ),
      body: Stack(
        children: [
          Image(image: AssetImage(AppAssets.suraBg),width: double.infinity,height: double.infinity,fit: BoxFit.fill,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width*0.05,vertical: height*0.02),
            child: Column(
              children: [
                Text('${SurasDetails.arabicAuranSuras[index]}',style: AppTextStyle.bold24Gold,),
                SizedBox(height: height*0.05,),
               show? FirstFormSoraScreen(verses: verses, height: height) 
                   : SecondFormSoraScreen(height: height, connectVerses: connectVerses)
                ,SizedBox(height: height*0.115,)
              ],
            ),
          )
        ],
      ),
    );
  }

  void suraFile(int index)async{
   String fileContent =await rootBundle.loadString('assets/suras/${index+1}.txt');
        List<String> suraLines = fileContent.split('\n');
        verses = suraLines;
        for(int i=0 ;i<suraLines.length;i++){
          suraLines[i] += "[${i+1}]  ";
        }
        connectVerses=suraLines.join();
        setState(() {
        });
  }
}
