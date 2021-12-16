import 'package:flutter/material.dart';
import 'countmodle.dart';
import 'package:provider/provider.dart';

class xiyineikexue_pageX extends StatefulWidget {
  xiyineikexue_pageX({Key? key}) : super(key: key);

  @override
  _xiyineikexue_pageXState createState() => _xiyineikexue_pageXState();
}

class _xiyineikexue_pageXState extends State<xiyineikexue_pageX> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text('西医内科学页面正在设计中.......'),
        Visibility(
          child: Text("Count ${context.watch<CountModle>().count}"),
          visible: false,
        ),
      ],
    );
  }
}
