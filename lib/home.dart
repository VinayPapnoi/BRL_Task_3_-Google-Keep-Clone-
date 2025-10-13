import 'dart:ui';

import 'package:brl_task_3/colors.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _drawerkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: true,
      key: _drawerkey,
      drawer: Drawer(),
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          child: Column(
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
            ],
          ),
        ),
      ),
    );
  }
}
