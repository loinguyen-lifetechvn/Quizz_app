import 'dart:io';

import 'package:quiz_app/core/model/base_table.dart';
import 'package:quiz_app/core/model/field_name.dart';
import 'package:quiz_app/core/service/api.dart';
import 'package:quiz_app/core/extension/extension.dart';

class QuizzAddController {
  String? _title;
  String? _description;
  String? _numberQA;
  File? _image;

  set title(String? value) {
    _title = value;
  }

  set image(File? value) {
    _image = value;
  }

  set description(String? value) {
    _description = value;
  }

  set numberQA(String? value) {
    _numberQA = value;
  }

  void addQuizz() async {
    Api api = Api(BaseTable.quizzes);
    await api.addDocument({
      FieldName.title: _title,
      FieldName.description: _description,
      FieldName.numberQA: int.parse(_numberQA ?? '1'),
    }, file: _image).then((value) {
      value.backOrNotification();
    });
  }
}
