import 'package:flutter/material.dart';

import '../../../../../utlis/app_text .dart';
                                              /// verses in join (connected)

class SecondFormSoraScreen  extends StatelessWidget{
  var connectVerses;
  var height;
  SecondFormSoraScreen({super.key,required this.height,required this.connectVerses});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(padding: EdgeInsets.only(top: height * 0.01),
        itemBuilder: (context, index) {
          return Text("$connectVerses ", style: AppTextStyle.bold20Gold,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,);
        },
        itemCount: 1,
        shrinkWrap: true,),
    );
  }
}
