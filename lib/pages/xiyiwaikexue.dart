import 'package:flutter/material.dart';
import 'countmodle.dart';
import 'package:provider/provider.dart';

class xiyiwaikexue_pageX extends StatefulWidget {
  xiyiwaikexue_pageX({Key? key}) : super(key: key);

  @override
  _xiyiwaikexue_pageXState createState() => _xiyiwaikexue_pageXState();
}

class _xiyiwaikexue_pageXState extends State<xiyiwaikexue_pageX> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text('西医外科学页面正在设计中.......'),
        Visibility(
          child: Text("Count ${context.watch<CountModle>().count}"),
          visible: false,
        ),
      ],
    );
  }
}
