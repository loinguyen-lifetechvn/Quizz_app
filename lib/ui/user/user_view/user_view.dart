import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/core/service/auth_service.dart';
import 'package:quiz_app/core/service/get_navigation.dart';
import 'package:quiz_app/locator.dart';
import 'package:quiz_app/ui/base_widget/lf_appbar.dart';
import 'package:quiz_app/ui/base_widget/lf_button_submit.dart';
import 'package:quiz_app/ui/base_widget/with_spacing.dart';
import 'package:quiz_app/ui/resources/assets_manager.dart';
import 'package:quiz_app/ui/resources/color_manager.dart';
import 'package:quiz_app/ui/resources/routes_manager.dart';
import 'package:quiz_app/ui/resources/styles_manager.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  late User user;

  late String _userName;

  final AuthenticationService _auth = AuthenticationService();
  @override
  void initState() {
    if (_auth.getCurrentUser() == null) {
      locator<GetNavigation>().replaceTo(RouterPath.login);
    } else {
      user = _auth.getCurrentUser()!;
      _userName = user.displayName == null
          ? 'Username: Empty'
          : 'Username: ${user.displayName}';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LFAppBar(
        title: 'Info user',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 80,
              child: Image.asset(ImageAssets.user),
            ),
            const SizedBox(height: 32),
            info()
          ],
        ),
      ),
      bottomSheet: LFButtonSubmit(
        text: 'Logout',
        color: ColorManager.red,
        onPressed: () {
          _auth.signOut().then((value) {
            locator<GetNavigation>().toLogout();
          });
        },
      ),
    );
  }

  Widget info() {
    return ColumnWithSpacing(
      children: [
        Text(
          _userName,
          style: getTitleText(),
        ),
        Text(
          'Email: ${user.email}',
          style: getTitleText(),
        ),
      ],
    );
  }
}
