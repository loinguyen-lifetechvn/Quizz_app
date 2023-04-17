import 'package:quiz_app/core/extension/methods.dart';
import 'package:quiz_app/core/model/base_model.dart';
import 'package:quiz_app/core/model/field_name.dart';

class ScoreModel extends BaseModel {
  ScoreModel(super.data);

   int get score => Methods.getInt(data, FieldName.email);
   String get quizzesID => Methods.getString(data, FieldName.quizzesID);
}
