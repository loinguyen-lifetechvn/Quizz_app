import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/core/model/base_table.dart';
import 'package:quiz_app/core/model/quizz_model.dart';
import 'package:quiz_app/core/service/api.dart';
import 'package:quiz_app/ui/base/base_controller.dart';

class QuizManagerController extends BaseController {
  final Api _api = Api(BaseTable.quizzes);

  List<QuizzModel> get list => data.map((e) => QuizzModel(e)).toList();

  @override
  Stream<QuerySnapshot<Object?>?>? loadDataStream() {
    return _api.streamDataCollection();
  }
}
