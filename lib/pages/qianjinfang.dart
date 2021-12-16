import 'package:flutter/material.dart';
import 'countmodle.dart';
import 'package:provider/provider.dart';

class qianjinfang_pageX extends StatefulWidget {
  qianjinfang_pageX({Key? key}) : super(key: key);

  @override
  _qianjinfang_pageXState createState() => _qianjinfang_pageXState();
}

class _qianjinfang_pageXState extends State<qianjinfang_pageX> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text('千金方页面正在设计中.......'),
        Visibility(
          child: Text("Count ${context.watch<CountModle>().count}"),
          visible: false,
        ),
      ],
    );
  }
}
