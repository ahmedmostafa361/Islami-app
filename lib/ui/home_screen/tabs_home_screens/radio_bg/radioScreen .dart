import 'package:flutter/material.dart';
import 'package:islami_app_flutter/ui/home_screen/tabs_home_screens/radio_bg/radio_item%20.dart';
import 'package:islami_app_flutter/utlis/app_colors%20.dart';

class Radioscreen extends StatelessWidget {
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

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: height * 0.062,
                margin: EdgeInsets.symmetric(horizontal: width * 0.03),
                decoration: BoxDecoration(
                  color: AppColors.bgColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TabBar(
                  dividerColor: AppColors.transparentColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: AppColors.goldColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelColor: AppColors.blackColor,
                  unselectedLabelColor: AppColors.whiteColor,
                  tabs: [
                    Tab(text: "Radio"),
                    Tab(text: "Reciters"),
                  ],
                ),
              ),

              SizedBox(height: height * 0.01),

              Expanded(
                child: TabBarView(
                  children: [
                    ListView.builder(itemBuilder: (context, index) {
                      return RadioItem(index: index,);
                    }, itemCount: 5,
                      shrinkWrap: true,
                      padding: EdgeInsets.all(0),
                    ),
                    ListView.builder(itemBuilder: (context, index) {
                      return RadioItem(index: index,);
                    }, itemCount: 5,
                      shrinkWrap: true,
                      padding: EdgeInsets.all(0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}