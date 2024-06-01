import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:quiz_app/config/get_it_config.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/res/app_color.dart';
import 'package:quiz_app/res/app_constans.dart';
import 'package:quiz_app/res/app_images.dart';
import 'package:quiz_app/res/app_string.dart';
import 'package:quiz_app/res/app_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 340,
            height: 320,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset(photo1).image,
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 258,
                  height: 258,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset(photo2).image,
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Text(
                    LOGIN,
                    style: loginStyle,
                  ),
                ),
                Positioned(
                  top: 140,
                  left: defaultPadding * 3,
                  child: Image.asset(
                    photo4,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: defaultPadding2 + 5,
                  right: defaultPadding2,
                  child: Image.asset(
                    photo5,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    photo3,
                    height: 110,
                    width: 110,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: defaultPadding),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: defaultPadding * 3,
              width: 287,
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultPadding1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultPadding1),
                    borderSide: BorderSide(color: scondryColor, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultPadding1),
                    borderSide: BorderSide(color: scondryColor, width: 2),
                  ),
                  prefixIcon: Image.asset(emailPhoto),
                  hintText: HINTEMAIL,
                  hintStyle: emailPasswordStyle,
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                if (name.text.isNotEmpty) {
                  core.get<SharedPreferences>().setString("name", name.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(ENTERYOURNAME),
                      backgroundColor: red,
                    ),
                  );
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: defaultPadding * 3,
                width: 287,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      primaryColor,
                      elseColor,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(defaultPadding1),
                ),
                child: Text(
                  LOGIN,
                  style: loginButtonStyle,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              photo6,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
