// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/widgets/grid_view_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quiz_app/config/get_it_config.dart';
import 'package:quiz_app/res/app_color.dart';
import 'package:quiz_app/res/app_constans.dart';
import 'package:quiz_app/res/app_images.dart';
import 'package:quiz_app/res/app_string.dart';
import 'package:quiz_app/res/app_style.dart';

class ResultPage extends StatelessWidget {
  final int totalQuestion;
  ResultPage({
    Key? key,
    required this.totalQuestion,
  }) : super(key: key);

  double value = core.get<SharedPreferences>().getDouble("score")!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: AppBar(
          backgroundColor: scondryColor,
          leading: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset(appbarphoto3).image,
              ),
            ),
            child: Icon(
              Icons.arrow_back,
              color: elseColor,
            ),
          ),
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  resultAppbarPhoto1,
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: defaultPadding2,
                  ),
                  Image.asset(
                    resultAppbarPhoto2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: scondryColor,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 190,
              child: Container(
                width: 305,
                height: 159,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultPadding),
                  gradient: LinearGradient(
                    colors: [
                      primaryColor,
                      elseColor,
                    ],
                  ),
                ),
                child: GridView(
                  padding: const EdgeInsets.all(defaultPadding - 5),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0,
                  ),
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        gridViewItem(
                          num: '${value * defaultPadding / 2} %',
                          subtitle: COMPLETION,
                          numColor: scondryColor,
                          iconcolor: scondryColor,
                        ),
                        gridViewItem(
                          num: '$value%',
                          subtitle: CORRECT,
                          numColor: green,
                          iconcolor: green,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        gridViewItem(
                          num: "$totalQuestion",
                          subtitle: TOTAL,
                          numColor: scondryColor,
                          iconcolor: scondryColor,
                        ),
                        gridViewItem(
                          num: '${totalQuestion - value}',
                          subtitle: WRONG,
                          numColor: red,
                          iconcolor: red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              bottom: defaultPadding,
              right: 0,
              child: Image.asset(centerPhoto),
            ),
            Positioned(
              top: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(resultBackPhoto),
                  Image.asset(
                    resultBackPhoto,
                    width: 140,
                    height: 140,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 116,
                    height: 116,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                        image: Image.asset(resultPhoto).image,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          YOURSCORE,
                          style: scoreStyle,
                        ),
                        Text(
                          "${value * defaultPadding / 2}",
                          style: score100Style,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: defaultPadding * 3,
              left: defaultPadding,
              child: Image.asset(boolPhoto),
            ),
            Positioned(
              top: 370,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    child: Container(
                      height: defaultPadding2 + 5,
                      width: defaultPadding2 + 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: playAgainColor,
                      ),
                      child: Icon(
                        Icons.refresh,
                        color: white,
                      ),
                    ),
                  ),
                  Text(
                    PLAYAGAIN,
                    style: playAgainStyle,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
