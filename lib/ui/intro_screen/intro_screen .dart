import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app_flutter/utlis/app_assets%20.dart';
import 'package:islami_app_flutter/utlis/app_colors%20.dart';
import 'package:islami_app_flutter/utlis/app_routes%20.dart';
class IntroScreen extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {
    List<PageViewModel> getPages(){
      return[
         pagesOfIntro(img2: AppAssets.intro_1, text: 'Welcome to Islami App',paddingText: 60),
         pagesOfIntro(img2: AppAssets.intro_2, text: 'Welcome To Islami App',text2: 'We Are Very Excited To Have You In Our Community'),
      pagesOfIntro(img2: AppAssets.intro_3, text: 'Reading the Quran',text2: 'Read, and your Lord is the Most Generous'),
        pagesOfIntro(img2: AppAssets.intro_4, text: 'Bearish',text2: 'Praise the name of your Lord, the Most High'),
        pagesOfIntro(img2: AppAssets.intro_5, text: 'Holy Quran Radio',text2: 'You can listen to the Holy Quran Radio through the application for free and easily'),
      ];
    }
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: AppColors.blackColor,
        child: IntroductionScreen(
          globalHeader: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(image: AssetImage(AppAssets.islamiLogo),),
          ),
          globalBackgroundColor: AppColors.blackColor,
          pages: getPages(),
          showSkipButton: true,
          skip: Text('Skip', style: TextStyle(color: AppColors.goldColor)),
          next: Text('Next', style: TextStyle(color: AppColors.goldColor)),
          done: Text('Done', style: TextStyle(color: AppColors.goldColor)),
          dotsDecorator: DotsDecorator(
            activeColor: AppColors.goldColor,
            color: Colors.white,
          ),
          onDone: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.homeScreenRoute);
          },
        ),
      ),
    );

  }

  PageViewModel pagesOfIntro({required String img2, required String text,String text2 ='', double paddingText =10, double paddingText2 =25}){
    return PageViewModel(
      decoration: PageDecoration(boxDecoration: BoxDecoration(color: AppColors.blackColor)),
      bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 16),
          //   child: Image(image: AssetImage(AppAssets.islamiLogo),height: 171,width: 291,),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 16,right: 16,top: 170 ),
            child: Image(image: AssetImage(img2),height: 300,width: 372,),
          ),
          SizedBox(height: paddingText,),
          Text(text,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: AppColors.goldColor),),
          SizedBox(height: 25,),
          Text(text2,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: AppColors.goldColor),)

        ],
      ),
      titleWidget: SizedBox.shrink(),
    );
}

}