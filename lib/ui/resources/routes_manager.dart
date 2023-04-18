import 'package:flutter/material.dart';
import 'package:quiz_app/core/model/quizz_model.dart';
import 'package:quiz_app/ui/admin/quiz_manager/quiz_detail_view/quizz_detail_view.dart';
import 'package:quiz_app/ui/admin/quiz_manager/quiz_manager_view/quiz_manger_view.dart';
import 'package:quiz_app/ui/admin/quiz_manager/quizz_add_view/quizz_add_view.dart';
import 'package:quiz_app/ui/user/login_view/login_view.dart';
import 'package:quiz_app/ui/user/register_view/register_view.dart';
import 'package:quiz_app/ui/user/user_view/user_view.dart';

class RouterPath {
  static const String quizzAdd = "/quizzAdd";
  static const String quizzDetail = "/quizzDetail";
  static const String quizzManager = "/quizzManager";

  static const String login = "/";
  static const String register = "/register";
  static const String user = "/user";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      //Account
      case RouterPath.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RouterPath.register:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case RouterPath.user:
        return MaterialPageRoute(builder: (_) => const UserView());

      //Quizz
      case RouterPath.quizzAdd:
        return MaterialPageRoute(builder: (_) => QuizzAddView());
      case RouterPath.quizzManager:
        return MaterialPageRoute(builder: (_) => QuizManagerView());
      case RouterPath.quizzDetail:
        QuizzModel quizz = routeSettings.arguments as QuizzModel;
        return MaterialPageRoute(
            builder: (_) => QuizzDetailView(
                  model: quizz,
                ));

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text('No router'),
              ),
              body: const Center(
                child: Text('No router found'),
              ),
            ));
  }
}
