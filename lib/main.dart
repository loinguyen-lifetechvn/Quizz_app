import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/core/service/get_navigation.dart';
import 'package:quiz_app/firebase_options.dart';
import 'package:quiz_app/locator.dart';
import 'package:quiz_app/ui/resources/routes_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<GetNavigation>().navigatorKey,
      onGenerateRoute: (route) => RouteGenerator.getRoute(route),
    );
  }
}
