import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizy/data.dart';
import 'package:quizy/pages/home_page.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(milliseconds: 100),
      (Timer timer) {
        if (theme != null) {
          timer.cancel();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
