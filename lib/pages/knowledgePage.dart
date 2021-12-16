import 'package:flutter/material.dart';
import 'package:chinamedicine2/main.dart';
import 'package:flutter/material.dart';
import '../res/Zknowledge.dart';

class knowledge_page extends StatelessWidget {
  const knowledge_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listDataKnowledge.map((value) {
        return Card(
            margin: EdgeInsets.all(15),
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            // 抗锯齿
            clipBehavior: Clip.antiAlias,
            elevation: 30,
            // 阴影大小
            child: Column(children: <Widget>[
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  value["knowledgepicture"],
                  filterQuality: FilterQuality.low,
                  fit: BoxFit.fill,
                  colorBlendMode: BlendMode.color,
                ),
              ),
              Container(
                child: ExpansionTile(
                  title: Text(
                    "主题：" + value["knowledgetitle"],
                  ),
                  leading: Icon(Icons.favorite_border_outlined),
                  children: <Widget>[
                    ListTile(
                      title: Text("主题：" + value["knowledgetitle"],
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                        "内容：" + value["knowledgecontent"],
                        maxLines: 2000,
                        textAlign: TextAlign.justify,
                        style:
                            TextStyle(color: Colors.indigoAccent, fontSize: 14),
                      ),
                      // item左侧的图像
                      // leading: Icon(
                      //   Icons.ac_unit,
                      //   color: Colors.blue[500],
                      //),
                      // 列表尾部的图标
                      //trailing: const Icon(Icons.chevron_right),
                      isThreeLine: true,
                      // dense: true, // 让文本变小
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 30.0),
                      selected: true, // 如果选中列表的 item 项，那么文本和图标的颜色将成为主题的主颜色。
                      onTap: () {},
                      onLongPress: () {},
                    ),
                  ],
                ),
              ),
              //Text("新闻发布者：" + value["publisher"]),
            ]));
      }).toList(),
    );
  }
}
