import 'package:quiz_app/core/extension/methods.dart';
import 'package:quiz_app/core/model/base_model.dart';
import 'package:quiz_app/core/model/field_name.dart';

class QuizzModel extends BaseModel {
  QuizzModel(super.data);

  String get title => Methods.getString(data, FieldName.title);
  String get description => Methods.getString(data, FieldName.description);
  String get numberQA => Methods.getString(data, FieldName.numberQA);
}
