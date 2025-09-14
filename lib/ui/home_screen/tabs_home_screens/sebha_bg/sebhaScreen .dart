import 'package:flutter/material.dart';
import 'package:islami_app_flutter/utlis/app_assets%20.dart';
import 'package:islami_app_flutter/utlis/app_text%20.dart';

class Sebhascreen extends StatefulWidget {
  const Sebhascreen ({super.key});

  @override
  State<Sebhascreen> createState() => _SebhascreenState();
}

class _SebhascreenState extends State<Sebhascreen> {
  List<String> azkar = ['سبحان الله', 'الحمد لله', 'الله أكبر'];
  int currentZikrIndex = 0;
  int counter = 33;
  double turns = 0;

  void onTabSebha() {
    turns += 1 / 33;
    counter--;
    if (counter == 0) {
      currentZikrIndex = (currentZikrIndex + 1) % azkar.length;
      counter = 33;
    }
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;

    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.06, right: width * 0.06

      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //
          Text('سبح اسم ربك الأعلى', style: AppTextStyle.bold36White,
            textAlign: TextAlign.center,)
          , SizedBox(height: height * 0.075,),
          GestureDetector(onTap: onTabSebha,

            child: Container(
              height: height * 0.49,
              child: Stack(
                children: [
                  AnimatedRotation(duration: const Duration(milliseconds: 300),
                      // alignment: Alignment.center,
                      turns: turns,
                      child: Image(
                        image: AssetImage(AppAssets.sebha1)
                        , height: double.infinity
                        , width: double.infinity,
                        fit: BoxFit.contain,)),
                  Container(alignment: Alignment.center,
                      margin: EdgeInsets.only(bottom: height * 0.04),
                      child: Text(azkar[currentZikrIndex],
                        style: AppTextStyle.bold36White,
                        textAlign: TextAlign.center,)),
                  Container(alignment: Alignment.center,
                      margin: EdgeInsets.only(top: height * 0.12),
                      child: Text('$counter', style: AppTextStyle.bold36White,
                        textAlign: TextAlign.center,)),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
