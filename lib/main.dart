import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_app/layouts/home_layout.dart';
import 'package:social_app/shared/styles/colors.dart';

import 'modules/loging_screen/loging_screen.dart';
import 'modules/register_sceen/register_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // is not restarted.
        primarySwatch: MAIN_COLOR,
      ),
      home: LoginScreen(),
    );
  }
}
