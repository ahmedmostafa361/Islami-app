import 'package:flutter/material.dart';

import '../../../../../utlis/app_colors .dart';
import '../../../../../utlis/app_text .dart';
                                                    /// verses in containers
class FirstFormSoraScreen extends StatefulWidget {
  final List<String> verses;
  final double height;

  const FirstFormSoraScreen(
      {super.key, required this.verses, required this.height});

  @override
  State<FirstFormSoraScreen> createState() => _FirstFormSoraScreenState();
}

class _FirstFormSoraScreenState extends State<FirstFormSoraScreen> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(
            top: widget.height * 0.01
        ), itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              selectedIndex == index ? selectedIndex = null : selectedIndex =
                  index;
            });
          },
          child: Container(

              padding:  EdgeInsets.symmetric(
                  vertical: widget.height * 0.025),
              margin: EdgeInsets.only(bottom: widget.height * 0.01
              ),
              decoration: BoxDecoration(
                  color: selectedIndex == index ? AppColors.goldColor : null,
                  borderRadius: BorderRadius.all(Radius.circular(16)
              ),
                  border: Border.all(color: AppColors.goldColor,width: 2)
              ),
              child: Text(
                widget.verses[index], style: selectedIndex == index
                  ? AppTextStyle.bold20Black
                  : AppTextStyle.bold20Gold,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
              )
          ),
        );
      },
        itemCount: widget.verses.length, shrinkWrap: true,),
    );
  }
}
