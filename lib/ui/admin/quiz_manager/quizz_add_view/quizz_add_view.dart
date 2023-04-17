import 'package:flutter/material.dart';
import 'package:quiz_app/ui/admin/quiz_manager/quizz_add_view/controller/quizz_add_controller.dart';
import 'package:quiz_app/ui/admin/quiz_manager/base_quiz_view.dart';
import 'package:quiz_app/ui/base_widget/lf_form_picker.dart';
import 'package:quiz_app/ui/base_widget/lf_text_field.dart';

class QuizzAddView extends BaseQuizView {
  QuizzAddView({super.key});
  final QuizzAddController controller = QuizzAddController();

  @override
  String get titleAppbar => 'Add quizz';

  @override
  void onSubmitForm() {
    controller.addQuizz();
  }

  @override
  List<Widget> get listTextField => [
        LFTextFormField(
          label: 'Title',
          onSaved: (p0) => controller.title = p0,
        ),
        LFTextFormField(
          label: 'Description',
          maxLines: null,
          onSaved: (p0) => controller.description = p0,
        ),
        LFTextFormField(
          label: 'Number Quiz',
          keyboardType: TextInputType.number,
          onSaved: (p0) => controller.numberQA = p0,
        ),
        LFFormPicker(
          onSaved: (p0) => controller.image = p0,
        )
      ];
}
