import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app_flutter/ui/home_screen/tabs_home_screens/hadeth_bg/hadeth_item%20.dart';

class Hadethscreen  extends StatelessWidget {
  const Hadethscreen ({super.key});

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

    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 0.75,
        height: height * 0.66,
        enlargeCenterPage: true,
      ),
      items: List.generate(50, (index) => index + 1,).map((index) {
        return Builder(
          builder: (BuildContext context) {
            return HadethItem(index: index, height: height, width: width,);
          },
        );
      }).toList(),
    );
  }
}