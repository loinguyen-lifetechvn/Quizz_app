
import 'package:quiz_app/core/extension/methods.dart';
import 'package:quiz_app/core/model/field_name.dart';

class BaseModel {
  BaseModel(this.data);
  final Map<String, dynamic> data;
  String get id => Methods.getString(data, 'id');
  String get createDate =>
      Methods.convertTime(Methods.getDateTime(data, FieldName.createDate),
          defaultFormat: 'dd/MM/yyyy');
          String get updateDate =>
      Methods.convertTime(Methods.getDateTime(data, FieldName.createDate),
          defaultFormat: 'dd/MM/yyyy');
  ///Foreign key
  String get refID => Methods.getString(data, FieldName.refID);
  String get img => Methods.getString(data, FieldName.img);
}