import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app_flutter/ui/home_screen/tabs_home_screens/time_bg/azkar_item%20.dart';
import 'package:islami_app_flutter/ui/home_screen/tabs_home_screens/time_bg/time_screen_item%20.dart';
import 'package:islami_app_flutter/utlis/app_assets%20.dart';
import 'package:islami_app_flutter/utlis/app_text%20.dart';

class Timescreen   extends StatelessWidget {
  const Timescreen ({super.key});

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
        padding: EdgeInsets.symmetric(
            vertical: width * 0.03, horizontal: height * 0.03),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: height * 0.32,
              width: width * 0.9,
              child: Stack(
                children: [
                  Image(
                    image: AssetImage(AppAssets.prayTime),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill,),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.10, bottom: 0.2),
                    child: Container(
                      // color: Colors.blue,
                        height: height * 0.155,
                        width: double.infinity,
                        child: CarouselSlider(
                          options: CarouselOptions(
                              aspectRatio: 2,
                              viewportFraction: 0.28,
                              padEnds: true,
                              // height: height * 0.16,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              disableCenter: false,
                              initialPage: 3
                          ),
                          items: List.generate(5, (index) => index,).map((
                              index) {
                            return Builder(
                              builder: (BuildContext context) {
                                return TimeScreenItem(index: index,);
                              },
                            );
                          }).toList(),
                        )
                    ),
                  ),
                  // Align(alignment: Alignment.bottomCenter,
                  //     child: Text('Next Pray : 2:15',style: AppTextStyle.bold16black,)
                  // ),
                  Container(alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(bottom: height * 0.015),
                      child: Text(
                        'Next Pray : 2:15', style: AppTextStyle.bold16black,)
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.02,),
            Text('Azkar', style: AppTextStyle.bold16White,),
            SizedBox(height: height * 0.02,),
            Expanded(
              child: Row(crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: AzkarItem(
                        text: 'Evening Azkar', img: AppAssets.bell1,)
                  ),
                  SizedBox(width: width * 0.03,)
                  ,
                  Expanded(
                      child: AzkarItem(
                        text: 'Morning Azkar', img: AppAssets.bell2,)
                  )
                ],
              ),
            ),
            SizedBox(height: height * 0.01,),

          ],
        )
    );
  }
}
