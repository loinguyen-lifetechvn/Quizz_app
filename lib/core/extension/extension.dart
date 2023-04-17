import 'package:quiz_app/core/service/get_navigation.dart';
import 'package:quiz_app/locator.dart';

extension CallBackAPI on String? {
  //Try if turn back screen previous
  void backOrNotification() {
    if (this == null) {
      locator<GetNavigation>().back();
    } else {
      locator<GetNavigation>().openDialog(content: this);
    }
  }
}