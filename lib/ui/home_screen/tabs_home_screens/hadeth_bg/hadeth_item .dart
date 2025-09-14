import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app_flutter/ui/home_screen/tabs_home_screens/hadeth_bg/hadeth_model%20.dart';
import 'package:islami_app_flutter/utlis/app_assets%20.dart';
import 'package:islami_app_flutter/utlis/app_colors%20.dart';
import 'package:islami_app_flutter/utlis/app_routes%20.dart';
import 'package:islami_app_flutter/utlis/app_text%20.dart';

class HadethItem extends StatefulWidget {
  final double height;
  final double width;
  final int index;

  const HadethItem({
    super.key,
    required this.index,
    required this.height,
    required this.width,
  });

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  HadethModel? hadethModel;

  @override
  void initState() {
    super.initState();
    loadHadethFileContent();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(AppRoutes.hadethScreenRoute, arguments: hadethModel);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.goldColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: hadethModel == null
            ? Center(
                child: CircularProgressIndicator(color: AppColors.blackColor),
              )
            : Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: widget.height * 0.02),
                    child: Image(
                      image: AssetImage(AppAssets.suraBg),
                      color: AppColors.blackColor,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: widget.height * 0.04),
                        child: Text(
                          hadethModel?.title ?? '',
                          style: AppTextStyle.bold24Black,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: widget.height * 0.03),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.only(
                            right: widget.width * 0.044,
                            left: widget.width * 0.044,
                          ),
                          child: Text(
                            hadethModel?.content ?? '',
                            style: AppTextStyle.bold16black,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: widget.height * 0.09),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  void loadHadethFileContent() async {
    String fileContent = await rootBundle.loadString(
      'assets/hadeeth/h${widget.index}.txt',
    );
    String title = fileContent.substring(0, fileContent.indexOf('\n'));
    String content = fileContent.substring(fileContent.indexOf('\n') + 1);
    hadethModel = HadethModel(title: title, content: content);
    setState(() {});
  }
}
