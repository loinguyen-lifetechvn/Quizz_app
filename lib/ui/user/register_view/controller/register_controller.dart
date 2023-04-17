import 'package:quiz_app/core/service/auth_service.dart';
import 'package:quiz_app/core/service/get_navigation.dart';
import 'package:quiz_app/locator.dart';
import 'package:quiz_app/ui/base_widget/lf_dialog.dart';
import 'package:quiz_app/ui/resources/routes_manager.dart';

class RegisterController {
  String? _email;
  String? _password;

  set email(String? value) => _email = value;

  set password(String? value) => _password = value;

  final AuthenticationService auth = AuthenticationService();

  void signUp() async {
    await auth.signUp(_email ?? '', _password ?? '').then((value) {
      if (value != null) {
        locator<GetNavigation>()
            .openDialog(typeDialog: TypeDialog.error, content: value);
      } else {
        locator<GetNavigation>().openDialog(
          typeDialog: TypeDialog.sucesss,
          content: 'You have successfully registered',
          onClose: () {
            locator<GetNavigation>().replaceTo(RouterPath.login);
          },
        );
      }
    });
  }
}
