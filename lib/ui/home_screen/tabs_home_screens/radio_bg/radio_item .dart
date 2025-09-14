import 'package:flutter/material.dart';
import 'package:islami_app_flutter/utlis/app_assets%20.dart';
import 'package:islami_app_flutter/utlis/app_text%20.dart';

class RadioItem extends StatefulWidget {
  const RadioItem({super.key, required this.index});

  final int index;

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  List<String> name = [
    'Ibrahim Al-Akdar',
    'Akram Alalaqmi',
    'Majed Al-Enezi',
    'Malik shaibat Alhamed',
    'AL Menshawy',
  ];

  bool playingSound = true;
  bool playingRadio = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.01,
      ),
      height: height * 0.15,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.radio),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(name[widget.index], style: AppTextStyle.bold20Black),
          SizedBox(width: width * 0.001),
          Padding(
            padding: EdgeInsets.only(left: width * 0.14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    playingRadio = !playingRadio;
                    setState(() {});
                  },
                  icon: Icon(
                    playingRadio ? Icons.play_arrow_rounded : Icons.pause,
                    size: width * 0.1,
                  ),
                ),
                SizedBox(width: width * 0.005),
                IconButton(
                  onPressed: () {
                    playingSound = !playingSound;
                    setState(() {});
                  },
                  icon: Icon(
                    playingSound ? Icons.volume_up : Icons.volume_off,
                    size: width * 0.1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
