import 'package:flutter/material.dart';
import 'countmodle.dart';
import 'package:provider/provider.dart';
import 'newsPage.dart';

class bencaogangmu_pageX extends StatefulWidget {
  bencaogangmu_pageX({Key? key}) : super(key: key);

  @override
  _bencaogangmu_pageXState createState() => _bencaogangmu_pageXState();
}

class _bencaogangmu_pageXState extends State<bencaogangmu_pageX> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text('本草纲目页面正在设计中.......'),
        Visibility(
          child: Text("Count ${context.watch<CountModle>().count}"),
          visible: false,
        ),
      ],
    );
  }
}
