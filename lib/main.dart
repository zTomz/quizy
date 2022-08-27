import 'package:flutter/material.dart';
import 'package:quizy/pages/loading_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.red,
        primaryColor: Colors.red,
        accentColor: const Color(0XFF010C14),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xFF010C14),
          ),
          bodyText1: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Color(0xFF010C14),
          ),
          bodyText2: TextStyle(
            fontSize: 15,
            color: Color(0xFF010C14),
          ),
        ),
      ),
      home: const LoadingPage(),
    );
  }
}
