import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app_flutter/utlis/app_assets%20.dart';
import 'package:islami_app_flutter/utlis/app_colors%20.dart';
class HomeScreen extends StatefulWidget  {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex =0;
   Map<int,String> selectedBackground ={
    0 : AppAssets.bg1,
     1 : AppAssets.bg2,
     2 : AppAssets.bg3,
     3 : AppAssets.bg4,
     4 : AppAssets.bg5
   };
@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Image(image: AssetImage(selectedBackground[selectedIndex]!),width: double.infinity,height: double.infinity,fit: BoxFit.fill,),
       Scaffold(
         bottomNavigationBar: Theme(
           data: Theme.of(context).copyWith(
             canvasColor: AppColors.goldColor
           ),
           child: BottomNavigationBar(
             currentIndex: selectedIndex,
             onTap: (index) {
               setState(() {
                 selectedIndex=index;
               });
             } ,
             backgroundColor:AppColors.goldColor ,
               items: [
                 BottomNavigationBarItem(icon: selectedItem(0, AppAssets.iconQuran),
                   label: 'Quran',
                 ),
                 BottomNavigationBarItem(icon: selectedItem(1, AppAssets.iconHadeth),
                     label: 'Hadeth'
                 ), BottomNavigationBarItem(icon: selectedItem(2, AppAssets.iconSebha),
                     label: 'sebha'
                 ), BottomNavigationBarItem(icon: selectedItem(3, AppAssets.iconRadio),
                     label: 'Radio'
                 ), BottomNavigationBarItem(icon: selectedItem(4, AppAssets.iconTime),
                     label: 'Time'
                 ),


               ]
           ),
         ),
       )

      ],

    );
  }
  Widget selectedItem(int index , String iconName) {
    return  selectedIndex==index ?Container(
        padding: EdgeInsets.symmetric(
            horizontal: 20, vertical: 6),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(66),
            color: AppColors.blackColor),
        child: ImageIcon(
            AssetImage(iconName)
        )
    ): ImageIcon(AssetImage(iconName));
  }
}