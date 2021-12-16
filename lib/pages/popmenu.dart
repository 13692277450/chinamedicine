import 'dart:core';
import 'package:flutter/material.dart';
import 'tabs.dart';
import '../pages/sortPage.dart';
import 'routes.dart';
import '../res/Cold.dart';
import '../res/Cancer.dart';
import '../res/Arthrosis.dart';
import '../res/Blood.dart';
import 'home.dart';
import 'package:chinamedicine2/main.dart';
import 'settingsPage.dart';

class popupmenu_page extends StatelessWidget {
  const popupmenu_page(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      padding: EdgeInsets.all(0.0),
      margin: EdgeInsets.all(0.0),
      child: showPopupMenuButton(),
    );
  }
}

class showPopupMenuButton extends StatelessWidget {
  const showPopupMenuButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PopupMenuButton<String>(
          icon: Icon(
            Icons.settings,
            color: Colors.black54,
          ),
          onSelected: (String string) {},
          itemBuilder: (BuildContext context) =>
              // taskPopMenu()
              <PopupMenuItem<String>>[
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.label_important,
                        color: Colors.teal[100],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Head"),
                    ],
                  ),
                  value: 'Blood',
                  onTap: () {
                    Navigator.pushNamed(context, '/sort_pagehead');
                    //  arguments: {'arguments': listDataBlood});
                    // setState() {
                    //   sort_page();
                    // }
                  },
                ),
                PopupMenuItem(
                  child: Text("Cold"),
                  value: 'Cold',
                  onTap: () {
                    Navigator.pushNamed(context, '/sort_pagecold');
                    //arguments: {'arguments': listDataCold});
                    // setState() {
                    //   sort_page();
                    // }
                  },
                ),
                PopupMenuItem(
                  child: Text("Eyes"),
                  value: "Eyes",
                ),
                PopupMenuItem(
                  child: Text("Head"),
                  value: "Head",
                )
              ]),
    );
  }
}
