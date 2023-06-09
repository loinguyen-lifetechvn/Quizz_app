import 'package:flutter/material.dart';
import 'package:quiz_app/core/service/get_navigation.dart';
import 'package:quiz_app/locator.dart';
import 'package:quiz_app/ui/base_widget/form_data.dart';
import 'package:quiz_app/ui/base_widget/lf_text_field.dart';
import 'package:quiz_app/ui/base_widget/title_logo_item.dart';
import 'package:quiz_app/ui/resources/assets_manager.dart';
import 'package:quiz_app/ui/resources/color_manager.dart';
import 'package:quiz_app/ui/resources/routes_manager.dart';
import 'package:quiz_app/ui/resources/styles_manager.dart';
import 'package:quiz_app/ui/resources/values_manager.dart';
import 'package:quiz_app/ui/user/login_view/controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.greyBG,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(
          top: AppPadding.p30,
          left: AppPadding.p16,
          right: AppPadding.p16,
          bottom: AppPadding.p16,
        ),
        child: Column(
          children: [
            const TitleLogoItem(),
            const SizedBox(height: 16),
            //Form
            signIn(),
            const Expanded(child: SizedBox()),
            //SignIn by
            signInByLabel(),
            const SizedBox(height: 8),
            bottom(),
          ],
        ),
      ),
    );
  }

  Widget signInByLabel() {
    return Text(
      'Or sign up by',
      style: getLabelText(),
    );
  }

  Widget bottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        itemIcon(ImageAssets.newAccount, onTap: () {
          locator<GetNavigation>().to(RouterPath.register);
        }),
        itemIcon(ImageAssets.facebook, onTap: () {
          controller.facebookSignIn();
        }),
        itemIcon(ImageAssets.google, onTap: () {
          controller.googleSignIn();
        }),
      ],
    );
  }

  Widget itemIcon(String asset, {required void Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        asset,
        width: AppSize.s40,
        height: AppSize.s40,
      ),
    );
  }

  Widget signIn() {
    return FormData(
        title: 'Sign In',
        onSubmit: () {
          controller.signIn();
        },
        list: listTFF);
  }

  List<Widget> get listTFF => [
        LFTextFormField(
          label: 'Email',
          onSaved: (p0) => controller.email = p0,
        ),
        LFTextFormField(
          label: 'Password',
          obscureText: true,
          onSaved: (p0) => controller.password = p0,
        ),
      ];
}
