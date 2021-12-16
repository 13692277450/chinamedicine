import 'package:chinamedicine2/pages/bencaogangmu.dart';
import 'package:chinamedicine2/pages/qianjinfang.dart';
import 'package:chinamedicine2/pages/xiyineikexue.dart';
import 'package:chinamedicine2/pages/xiyiwaikexue.dart';
import 'package:chinamedicine2/pages/zhonghuabencao.dart';
import 'package:flutter/material.dart';
import 'package:chinamedicine2/main.dart';
import 'package:flutter/material.dart';
import '../res/Znewsdata.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'famousdoctor.dart';
import 'countmodle.dart';
import 'package:provider/provider.dart';
import 'famousdoctor.dart';

class classic_pageX extends StatefulWidget {
  classic_pageX({Key? key}) : super(key: key);

  @override
  _classic_pageXState createState() => _classic_pageXState();
}

int index = 0;
List _listpages = [
  famousedoctor_pageX(),
  bencaogangmu_pageX(),
  qianjinfang_pageX(),
  zhonghuabencao_pageX(),
  xiyineikexue_pageX(),
  xiyiwaikexue_pageX(),
];

class _classic_pageXState extends State<classic_pageX> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PageController _pageController;
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        height: 120,
        child: topswiper(),
      ),
      Divider(height: 2),
      // Expanded(
      //   child: home_details(),
      // ),
      // Divider(),
      Container(
        alignment: Alignment.center,
        height: 120,
        child: navi_pageX(),
      ),
      Divider(),
      Stack(
        alignment: Alignment.topLeft,
        children: [
          _listpages[index],
          Visibility(
            child: Text("Count ${context.watch<CountModle>().count}"),
            visible: false,
          ),
        ],
      )
    ]);
  }
}

class navi_pageX extends StatefulWidget {
  navi_pageX({Key? key}) : super(key: key);

  @override
  _navi_pageXState createState() => _navi_pageXState();
}

class _navi_pageXState extends State<navi_pageX> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        scrollDirection: Axis.vertical,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, //横轴三个子widget
        padding: EdgeInsets.all(10),
        childAspectRatio: 2.5, //宽高比为1时，子widget
        children: [
          Container(
            height: 30,
            width: 100,
            // alignment: Alignment.bottomCenter,
            child: MyButton(
                text: "中华名医录",
                onPressed: () {
                  context.read<CountModle>().add();
                  setState(() {
                    index = 0;
                  });
                }),
          ),
          Container(
              height: 30,
              width: 100,
              child: MyButton(
                text: '本草纲目',
                onPressed: () {
                  context.read<CountModle>().add();
                  setState(() {
                    index = 1;
                  });
                },
              )),
          Container(
              height: 30,
              width: 100,
              child: MyButton(
                text: '千金方',
                onPressed: () {
                  context.read<CountModle>().add();
                  setState(() {
                    index = 2;
                  });
                },
              )),
          Container(
              height: 30,
              width: 100,
              child: MyButton(
                text: '中华本草',
                onPressed: () {
                  context.read<CountModle>().add();

                  setState(() {
                    index = 3;
                  });
                },
              )),
          Container(
              height: 30,
              width: 100,
              child: MyButton(
                text: '西医内科学',
                onPressed: () {
                  context.read<CountModle>().add();

                  setState(() {
                    index = 4;
                  });
                },
              )),
          Container(
              height: 30,
              width: 100,
              child: MyButton(
                text: '西医外科学',
                onPressed: () {
                  context.read<CountModle>().add();

                  setState(() {
                    index = 5;
                  });
                },
              )),
        ]);
  }
}

class MyButton extends StatelessWidget {
  final String text;
  final onPressed;
  //final height;
  //final width;

  const MyButton({Key? key, required this.text, this.onPressed = null})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
        onPressed: this.onPressed,
        child: Text(this.text),
        style: ButtonStyle(
            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 18)),
            backgroundColor: MaterialStateProperty.all(Colors.cyan[900]),
            foregroundColor: MaterialStateProperty.all(Color(0xFFC5D6EC)),
            side: MaterialStateProperty.all(
                BorderSide(width: 1, color: Color(0xFF2DA81D))),
            shadowColor: MaterialStateProperty.all(Colors.grey),
            elevation: MaterialStateProperty.all(15),
            shape: MaterialStateProperty.all(BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  //设置 界面效果
                  style: BorderStyle.solid,
                  color: Color(0xFFC08C67),
                  width: 1,

// shape: BeveledRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             side: BorderSide(width: 1,color: Colors.blue,
//             )),
                )))));
  }
}

class news_pageX extends StatelessWidget {
  const news_pageX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listDataNews.map((value) {
        return Card(
            margin: EdgeInsets.all(15),
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            // 抗锯齿
            clipBehavior: Clip.antiAlias,
            elevation: 20,
            // 阴影大小
            child: Column(children: <Widget>[
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  value["picture"],
                  filterQuality: FilterQuality.low,
                  fit: BoxFit.fill,
                  colorBlendMode: BlendMode.color,
                ),
              ),
              ListTile(
                title: Text("新闻：" + value["newstitle"],
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("内容：" + value["newscontent"]),
                // item左侧的图像
                leading: Icon(
                  Icons.ac_unit,
                  color: Colors.blue[500],
                ),
                // 列表尾部的图标
                trailing: const Icon(Icons.chevron_right),
                isThreeLine: true,
                dense: true, // 让文本变小
                contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                selected: true, // 如果选中列表的 item 项，那么文本和图标的颜色将成为主题的主颜色。
                onTap: () {},
                onLongPress: () {},
              ),
              Text("新闻发布者：" + value["publisher"]),
            ]));
      }).toList(),
    );
  }
}

class topswiper extends StatefulWidget {
  topswiper({Key? key}) : super(key: key);

  @override
  _topswiperState createState() => _topswiperState();
}

class _topswiperState extends State<topswiper> {
  List<Image> imgs = [
    //建立了一个图片数组
    Image.asset(
      "images/xhjsh.png",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "images/aizhi.png",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "images/yangsheng.png",
      fit: BoxFit.cover,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        alignment: Alignment.bottomCenter,
        child: Center(
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              //条目构建函数传入了index,根据index索引到特定图片
              return imgs[index];
            },
            itemCount: imgs.length,
            autoplay: true,
            //   pagination: new SwiperPagination(), //这些都是控件默认写好的,直接用
            //    control: new SwiperControl(),
          ),
        ));
  }
}
