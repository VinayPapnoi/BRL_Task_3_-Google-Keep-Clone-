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
              sectionOne(),
              SizedBox(height: 5),
              sectionTwo(),
              SizedBox(height: 5),
              sectionThree(),
              SizedBox(height: 5),
              sectionFour(),
              SizedBox(height: 5),
              sectionFive(),
              SizedBox(height: 5),
              sectionSix(),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionOne() {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            const Color.fromARGB(187, 8, 22, 228),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                //YAHA PE CHANGES KAR SAKTA HU, TO CHANGE CUTTON SHAPE

                //TODO change shape, if it feels weird
                // jaiseremove the top left part, to make it designer
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
        ),
        onPressed: () {},
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Icon(Icons.lightbulb, size: 30, color: white.withAlpha(178)),
              SizedBox(width: 10),
              Text("Notes", style: TextStyle(color: white, fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTwo() {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            const Color.fromARGB(100, 8, 22, 228),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                //YAHA PE CHANGES KAR SAKTA HU, TO CHANGE CUTTON SHAPE

                //TODO change shape, if it feels weird
                // jaiseremove the top left part, to make it designer
                //topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
        ),
        onPressed: () {},
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Icon(Icons.add, size: 30, color: white.withAlpha(178)),
              SizedBox(width: 10),
              Text(
                "Create new Label",
                style: TextStyle(color: white, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionThree() {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            const Color.fromARGB(100, 8, 22, 228),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                //YAHA PE CHANGES KAR SAKTA HU, TO CHANGE CUTTON SHAPE

                //TODO change shape, if it feels weird
                // jaiseremove the top left part, to make it designer
                //topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
        ),
        onPressed: () {},
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Icon(Icons.archive, size: 30, color: white.withAlpha(178)),
              SizedBox(width: 10),
              Text("Archive", style: TextStyle(color: white, fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionFour() {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            const Color.fromARGB(100, 8, 22, 228),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                //YAHA PE CHANGES KAR SAKTA HU, TO CHANGE CUTTON SHAPE

                //TODO change shape, if it feels weird
                // jaiseremove the top left part, to make it designer
                //topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
        ),
        onPressed: () {},
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Icon(Icons.delete, size: 30, color: white.withAlpha(178)),
              SizedBox(width: 10),
              Text("Deleted", style: TextStyle(color: white, fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionFive() {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            const Color.fromARGB(100, 8, 22, 228),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                //YAHA PE CHANGES KAR SAKTA HU, TO CHANGE CUTTON SHAPE

                //TODO change shape, if it feels weird
                // jaiseremove the top left part, to make it designer
                //topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
        ),
        onPressed: () {},
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Icon(Icons.settings, size: 30, color: white.withAlpha(178)),
              SizedBox(width: 10),
              Text("Settings", style: TextStyle(color: white, fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionSix() {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            const Color.fromARGB(100, 8, 22, 228),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                //YAHA PE CHANGES KAR SAKTA HU, TO CHANGE CUTTON SHAPE

                //TODO change shape, if it feels weird
                // jaiseremove the top left part, to make it designer
                bottomLeft: Radius.circular(50),
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
        ),
        onPressed: () {},
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Icon(Icons.help, size: 30, color: white.withAlpha(178)),
              SizedBox(width: 10),
              Text(
                "Help & feedback",
                style: TextStyle(color: white, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
