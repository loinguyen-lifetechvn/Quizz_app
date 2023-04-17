import 'package:flutter/material.dart';
import 'package:quiz_app/ui/resources/color_manager.dart';
import 'package:quiz_app/ui/resources/styles_manager.dart';

class LFAppBar extends AppBar {
  LFAppBar({
    super.key,
    required String title,
    Widget? suffix,
  }) : super(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title.toUpperCase(),
                  style: getTitleText(color: ColorManager.white),
                ),
                if (suffix != null) suffix
              ],
            ),
            backgroundColor: ColorManager.greyBG);
}
