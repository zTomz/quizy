// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:quizy/data.dart';

class HomeHeader extends StatefulWidget {
  double redBox;
  double whiteBox;
  HomeHeader({Key? key, required this.redBox, required this.whiteBox})
      : super(key: key);

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: 300,
      width: size.width,
      child: Stack(
        children: [
          Positioned(
            top: this.widget.redBox,
            child: Container(
              height: 200,
              width: size.width,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme!.primaryColor,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
              ),
              child: SafeArea(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Let´s play!",
                          style: theme!.textTheme.headline1,
                        ),
                        Text(
                          "Better knowledge with Quizy",
                          style: theme!.textTheme.bodyText2,
                        ),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: Image.asset("assets/Logo.png"),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -this.widget.whiteBox + 25,
            left: (size.width * 0.2) / 2,
            child: Container(
              width: size.width * 0.8,
              height: 150,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    spreadRadius: 4,
                    blurRadius: 6,
                    color: Color.fromARGB(138, 0, 0, 0),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Want to join a game?",
                    style: theme!.textTheme.bodyText1,
                  ),
                  Text(
                    "Enter a game code below",
                    style: theme!.textTheme.bodyText2,
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "Code",
                        suffixIcon: Container(
                          padding: const EdgeInsets.all(8),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text("Enter"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
