import 'package:flutter/material.dart';
import 'package:quiz_app/ui/resources/color_manager.dart';
import 'package:quiz_app/ui/resources/styles_manager.dart';

class LFButtonSubmit extends StatelessWidget {
  const LFButtonSubmit({super.key, this.text = 'Submit', this.onPressed});
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: ColorManager.green,
      child: Text(
        text,
        style: getTitleText(),
      ),
    );
  }
}
