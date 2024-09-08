
import 'package:flutter/material.dart';

import 'Films/Presentation/Screens/movies_screen.dart';
import 'core/Services/Services_Locator.dart';
import 'core/utils/app_string.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MoviesScreen(),
    );
  }
}
