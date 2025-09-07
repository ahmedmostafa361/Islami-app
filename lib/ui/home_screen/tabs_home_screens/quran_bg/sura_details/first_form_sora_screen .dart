import 'package:flutter/material.dart';
import '../../../../../utlis/app_colors .dart';
import '../../../../../utlis/app_text .dart';
                                                    /// verses in containers
class FirstFormSoraScreen extends StatelessWidget{
  List<String> verses;
   var height;
   FirstFormSoraScreen({super.key,required this.verses,required this.height});


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(color: Colors.transparent,
        child: ListView.builder(
          padding: EdgeInsets.only(
              top: height*0.01
          ),itemBuilder: (context, index) {
          return Container(
              padding:  EdgeInsets.symmetric(
                  vertical: height*0.025),
              margin: EdgeInsets.only(bottom: height*0.01
              ),
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)
              ),
                  border: Border.all(color: AppColors.goldColor,width: 2)
              ),
              child: Text(
                "${verses[index]} " ,style: AppTextStyle.bold20Gold,textDirection:TextDirection.rtl ,textAlign: TextAlign.center,
              )
          );
        },
          itemCount: verses.length,shrinkWrap: true,),
      ),
    );
  }
}
