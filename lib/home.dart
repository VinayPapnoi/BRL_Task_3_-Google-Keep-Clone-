import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:brl_task_3/colors.dart';
import 'package:brl_task_3/sideMenuBar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  String note =
      "Sample Note: this is a note lekjfiosejfosiefjsdkfsekdfjsdlkfjsdlkfjsdlkfjsldkfjsdlkfjksdl Sample Note: this is a note lekjfiosejfosiefjsdkfsekdfjsdlkfjsdlkfjsdlkfjsldkfjsdlkfjksdl Sample Note: this is a note lekjfiosejfosiefjsdkfsekdfjsdlkfjsdlkfjsdlkfjsldkfjsdlkfjksdl Sample Note: this is a note lekjfiosejfosiefjsdkfsekdfjsdlkfjsdlkfjsdlkfjsldkfjsdlkfjksdl Sample Note: this is a note lekjfiosejfosiefjsdkfsekdfjsdlkfjsdlkfjsdlkfjsldkfjsdlkfjksdl Sample Note: this is a note lekjfiosejfosiefjsdkfsekdfjsdlkfjsdlkfjsdlkfjsldkfjsdlkfjksdl ";
  String note1 = "Sample Note: this is a smaller notesgsevfs";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: true,
      key: _drawerkey,
      drawer: Sidemenu(),
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 51),
                        spreadRadius: 1,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              _drawerkey.currentState?.openDrawer();
                            },
                            icon: Icon(Icons.menu, color: white),
                          ),
                          SizedBox(width: 16),

                          Container(
                            height: 65,
                            width: 200,

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Search Your Notes',
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 127),
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                overlayColor: const Color.fromRGBO(
                                  255,
                                  255,
                                  255,
                                  0.3,
                                ),
                              ),
                              onPressed: () {},
                              child: const Icon(
                                Icons.grid_view,
                                color: Colors.white,
                              ),
                            ),

                            SizedBox(width: 9),
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                notesSectionAll(),

                /* Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      height: MediaQuery.of(context).size.height,

                      child: MasonryGridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        crossAxisCount: 2,

                        itemBuilder: (context, index) => Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: index.isEven
                                ? const Color.fromRGBO(27, 94, 32, 1)
                                : Colors.blue[900],
                            border: Border.all(
                              color: Color.fromRGBO(27, 94, 32, 1),
                            ),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "HEADING",
                                style: TextStyle(
                                  color: white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                index.isEven
                                    ? note.length > 250
                                          ? "${note.substring(0, 250)}..."
                                          : note
                                    : note1,
                                style: TextStyle(color: white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ), */
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget notesSectionAll() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            children: [
              Text(
                "ALL",
                style: TextStyle(
                  color: white.withAlpha(128),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          height: MediaQuery.of(context).size.height,

          child: MasonryGridView.count(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            crossAxisCount: 2,

            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: white.withAlpha(100)),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "HEADING",
                    style: TextStyle(
                      color: white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    index.isEven
                        ? note.length > 250
                              ? "${note.substring(0, 250)}..."
                              : note
                        : note1,
                    style: TextStyle(color: white),
                  ),
                ],
              ),
            ),
          ),
        ),

        SizedBox(height: 250),
      ],
    );
  }
}
