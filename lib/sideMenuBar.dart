import 'package:brl_task_3/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Sidemenu extends StatefulWidget {
  const Sidemenu({super.key});

  @override
  State<Sidemenu> createState() => _SidemenuState();
}

class _SidemenuState extends State<Sidemenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: bgColor),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                child: Text(
                  "Google Keep",
                  style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              Divider(color: white.withAlpha(178)),
              Container(
                margin: EdgeInsets.only(right: 15),
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.lightbulb,
                          size: 30,
                          color: white.withAlpha(178),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Notes",
                          style: TextStyle(color: white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
