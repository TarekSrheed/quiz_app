
import 'package:flutter/material.dart';
import 'package:quiz_app/res/app_constans.dart';
import 'package:quiz_app/res/app_style.dart';

class gridViewItem extends StatelessWidget {
  String num;
  String subtitle;
  Color iconcolor;
  Color numColor;
  gridViewItem(
      {Key? key,
      required this.num,
      required this.subtitle,
      required this.numColor,
      required this.iconcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: iconcolor,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              num,
              style: TextStyle(
                color: numColor,
                fontSize: defaultPadding,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              subtitle,
              style: gridSubTitleStyle,
            ),
          ],
        ),
      ],
    );
  }
}
