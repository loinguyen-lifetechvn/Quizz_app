import 'package:quiz_app/core/extension/log.dart';
import 'package:quiz_app/core/service/auth_service.dart';
import 'package:quiz_app/core/service/get_navigation.dart';
import 'package:quiz_app/locator.dart';
import 'package:quiz_app/ui/resources/routes_manager.dart';

class LoginController {
  String? _email;
  String? _password;

  AuthenticationService auth = AuthenticationService();

  set email(String? value) {
    _email = value;
  }

  set password(String? value) {
    _password = value;
  }

  void signIn() async {
    if (_email == 'admin@gmail.com' && _password == 'admin') {
      locator<GetNavigation>().replaceTo(RouterPath.quizzManager);
      logSuccess('Đăng nhập với tư cách admin');
    } else {
      await auth.signIn(_email ?? '', _password ?? '').then((value) {
        if (value == null) {
          locator<GetNavigation>().replaceTo(RouterPath.quizzManager);
          logSuccess('Đăng nhập với tư cách người dùng');
        } else {
          locator<GetNavigation>().openDialog(content: value);
        }
      });
    }
  }

  void googleSignIn() async {
    await auth.googleSignIn().then((value) {
      if (value == null) {
        locator<GetNavigation>().replaceTo(RouterPath.quizzManager);
      } else {
        locator<GetNavigation>().openDialog(content: value);
      }
    });
  }

  void facebookSignIn() async {
    await auth.facebookSignIn().then((value) {
      if (value == null) {
        locator<GetNavigation>().replaceTo(RouterPath.quizzManager);
      } else {
        locator<GetNavigation>().openDialog(content: value);
      }
    });
  }
}
