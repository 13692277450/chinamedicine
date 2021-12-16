import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'countmodle.dart';

class zhonghuabencao_pageX extends StatefulWidget {
  zhonghuabencao_pageX({Key? key}) : super(key: key);

  @override
  _zhonghuabencao_pageXState createState() => _zhonghuabencao_pageXState();
}

class _zhonghuabencao_pageXState extends State<zhonghuabencao_pageX> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text('中华本草页面正在设计中.......'),
        Visibility(
          child: Text("Count ${context.watch<CountModle>().count}"),
          visible: false,
        ),
      ],
    );
  }
}
