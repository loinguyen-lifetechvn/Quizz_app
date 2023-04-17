// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:quiz_app/ui/base_widget/form_data.dart';
import 'package:quiz_app/ui/base_widget/lf_appbar.dart';

abstract class BaseQuizView extends StatelessWidget {
  const BaseQuizView({
    Key? key,
  }) : super(key: key);
  String get titleAppbar;
  void onSubmitForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: LFAppBar(title: titleAppbar),
      body: FormData(
        onSubmit: onSubmitForm,
        list: listTextField,
        isFullScreen: true,
      ),
    );
  }

  List<Widget> get listTextField;
}
