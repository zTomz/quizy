import 'package:flutter/material.dart';
import 'package:quizy/data.dart';
import 'package:quizy/pages/quiz_page.dart';
import 'package:quizy/widgets/home_header.dart';
import 'package:quizy/widgets/mode_picker_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double redBox = 0;
  double whiteBox = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification &&
              notification.scrollDelta != null) {
            setState(() {
              redBox = redBox - notification.scrollDelta! / 2;
              whiteBox = whiteBox - notification.scrollDelta! / 2.1;
            });
          }
          return true;
        },
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(35),
                child: Column(
                  children: [
                    const SizedBox(height: 275),
                    title("Single Player"),
                    const ModePickerCard(
                      title: "Easy",
                      colors:  [
                        Color(0xFF0B7A75),
                        Color(0xFF5B9A65),
                        Color(0xFF95B46A),
                      ],
                    ),
                    const ModePickerCard(
                      title: "Medium",
                      colors:  [
                        Color(0xFF89A6FB),
                        Color(0xFF2D5D7B),
                        Color(0xFF9DCDC0),
                      ],
                    ),
                    const ModePickerCard(
                      title: "Hard",
                      colors:  [
                        Color(0xFFFF6C0A),
                        Color(0xFFFF330A),
                        Color(0xFFFFA630),
                      ],
                    ),
                    const SizedBox(height: 25),
                    title("Single Player"),
                    const ModePickerCard(
                      title: "Match",
                      colors:  [
                        Color(0xFFEC9A29),
                        Color(0xFFF2F230),
                      ],
                    ),
                    const ModePickerCard(
                      title: "Leaderboard",
                      colors: [
                        Color(0xFF91F291),
                        Color(0xFF61F2C2),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            HomeHeader(
              redBox: redBox,
              whiteBox: whiteBox,
            ),
          ],
        ),
      ),
    );
  }

  Widget title(String text) => Row(
        children: [
          Text(
            text,
            style: theme!.textTheme.bodyText1,
          ),
        ],
      );
}
