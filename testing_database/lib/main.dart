import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:testing_database/modules/login_screen/login_screen.dart';
import 'package:testing_database/shared/Bloc_Observer.dart';

import 'layout/HomeLayout.dart';
import 'modules/Counter/Counter_Screen.dart';
import 'modules/lessons_design/Lessons_Screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Homelayout(),
    );
  }
}
