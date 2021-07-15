import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_app/layouts/home_layout.dart';
import 'package:social_app/shared/cubits/bloc_observer.dart';
import 'package:social_app/shared/network/local/cache.dart';
import 'package:social_app/shared/styles/colors.dart';

import 'modules/loging_screen/loging_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  await Cache.init();
  //await Cache.sharedPreferences.remove('token');
  String token = Cache.sharedPreferences.get('token');
  Widget startWidget;
  if (token != null){
    startWidget = HomeLayout();
  } else {
    startWidget = LoginScreen();
  }
  runApp(MyApp(startWidget));

}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp(this.startWidget);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MAIN_COLOR,
      ),
      home: startWidget,
    );
  }
}
