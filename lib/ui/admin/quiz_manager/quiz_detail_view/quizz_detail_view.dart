import 'package:flutter/material.dart';
import 'package:quiz_app/core/model/quizz_model.dart';
import 'package:quiz_app/ui/admin/quiz_manager/base_quiz_view.dart';
import 'package:quiz_app/ui/admin/quiz_manager/quiz_detail_view/controller/quiz_detail_controller.dart';
import 'package:quiz_app/ui/base_widget/lf_form_picker.dart';
import 'package:quiz_app/ui/base_widget/lf_text_field.dart';

class QuizzDetailView extends BaseQuizView {
  QuizzDetailView({super.key, required this.model});
  final QuizzModel model;
  final QuizDetailControleller controller = QuizDetailControleller();

  @override
  String get titleAppbar => 'Dettail quizz';

  @override
  void onSubmitForm() {
    controller.updateQuizz(model.id);
  }

  @override
  List<Widget> get listTextField => [
        LFTextFormField(
          label: 'Title',
          initValue: model.title,
          onSaved: (p0) => controller.title = p0,
        ),
        LFTextFormField(
          label: 'Description',
          initValue: model.description,
          maxLines: null,
          onSaved: (p0) => controller.description = p0,
        ),
        LFTextFormField(
          label: 'Number Quiz',
          keyboardType: TextInputType.number,
          initValue: model.numberQA,
          onSaved: (p0) => controller.numberQA = p0,
        ),
        LFFormPicker(
          onSaved: (p0) => controller.image = p0,
          urlInit: model.img,
        )
      ];
}
