import 'package:flutter/material.dart';
import 'package:islami_app_flutter/ui/home_screen%20.dart';
import 'package:islami_app_flutter/ui/home_screen/tabs_home_screens/quran_bg/sura_details/sura_screen%20.dart';
import 'package:islami_app_flutter/ui/intro_screen/intro_screen%20.dart';
import 'package:islami_app_flutter/utlis/app_routes%20.dart';
import 'package:islami_app_flutter/utlis/app_theme%20.dart';

void main(){
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:AppRoutes.introScreenRoute ,
      routes:{
        AppRoutes.homeScreenRoute : (context) => HomeScreen(),
        AppRoutes.introScreenRoute : (context) => IntroScreen(),
        AppRoutes.suraScreenRoute : (context) => SuraScreen(),

      } ,
      darkTheme: AppTheme.darkTheme ,
      themeMode: ThemeMode.dark,
    );
  }
}
