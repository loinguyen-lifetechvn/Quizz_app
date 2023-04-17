import 'package:flutter/material.dart';
import 'package:quiz_app/core/model/quizz_model.dart';
import 'package:quiz_app/core/service/get_navigation.dart';
import 'package:quiz_app/locator.dart';
import 'package:quiz_app/ui/admin/quiz_manager/quiz_manager_view/controller/quiz_manager_controller.dart';
import 'package:quiz_app/ui/base/base_view.dart';
import 'package:quiz_app/ui/base_widget/lf_appbar.dart';
import 'package:quiz_app/ui/resources/color_manager.dart';
import 'package:quiz_app/ui/resources/routes_manager.dart';
import 'package:quiz_app/ui/resources/styles_manager.dart';

class QuizManagerView extends BaseView<QuizManagerController> {
  QuizManagerView({super.key}) : super(QuizManagerController());

  @override
  Widget getMainView(BuildContext context, QuizManagerController controller) {
    List<QuizzModel> list = controller.list;
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      itemCount: list.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (_, i) => cardQuiz(
        list[i],
      ),
    );
  }

  @override
  AppBar? appBar(BuildContext context) {
    return LFAppBar(title: 'Quiz manager');
  }

  @override
  Widget? floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        locator<GetNavigation>().to(RouterPath.quizzAdd);
      },
      child: const Icon(Icons.add),
    );
  }

  Widget cardQuiz(QuizzModel model) {
    return InkWell(
      onTap: () {
        locator<GetNavigation>().to(RouterPath.quizzDetail, arguments: model);
      },
      child: Card(
        elevation: 2,
        margin: EdgeInsets.zero,
        child: Row(
          children: [
            Expanded(
              child: Image.network(model.img),
            ),
            const SizedBox(width: 4),
            Expanded(
              flex: 4,
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Topic: ${model.title}',
                        style: getTitleText(),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Total question: ${model.numberQA}',
                        style: getTitleText(
                          color: ColorManager.blue,
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
