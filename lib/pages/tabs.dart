import 'package:chinamedicine2/res/Arthrosis.dart';
import 'package:chinamedicine2/res/BodyLess.dart';
import 'package:chinamedicine2/res/Cancer.dart';
import 'package:chinamedicine2/res/Diabetes.dart';
import 'package:chinamedicine2/res/Ear.dart';
import 'package:chinamedicine2/res/Eyes.dart';
import 'package:chinamedicine2/res/Falldown.dart';
import 'package:chinamedicine2/res/Grown.dart';
import 'package:chinamedicine2/res/Heart.dart';
import 'package:chinamedicine2/res/Hot.dart';
import 'package:chinamedicine2/res/Intestines.dart';
import 'package:chinamedicine2/res/Liver.dart';
import 'package:chinamedicine2/res/Lung.dart';
import 'package:chinamedicine2/res/Man.dart';
import 'package:chinamedicine2/res/Mouse.dart';
import 'package:chinamedicine2/res/NoQuiet.dart';
import 'package:chinamedicine2/res/Pain.dart';
import 'package:chinamedicine2/res/Piss.dart';
import 'package:chinamedicine2/res/Skin.dart';
import 'package:chinamedicine2/res/Stomach.dart';
import 'package:chinamedicine2/res/Stroke.dart';
import 'package:chinamedicine2/res/Think.dart';
import 'package:chinamedicine2/res/Toxicant.dart';
import 'package:chinamedicine2/res/Tumor.dart';
import 'package:chinamedicine2/res/Woman.dart';
import 'package:flutter/material.dart';
import 'package:chinamedicine2/main.dart';
import 'sortPage.dart';
import 'settingsPage.dart';
import 'knowledgePage.dart';
import 'newsPage.dart';
import 'home.dart';
import 'routes.dart';

import 'package:provider/provider.dart';
import 'countmodle.dart';
import '../res/Cold.dart';
import '../res/Blood.dart';
import '../res/Head.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentindex = 0;
  final List _listPage = [
    home_page(),
    sort_pageX(),
    classic_pageX(),
    knowledge_page(),
    settings_pageX(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listPage[_currentindex],

      appBar: AppBar(
        title: const Text('中国药典之中成药大全'),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            //设置背景色`BottomNavigationBar`
            canvasColor: Colors.teal[100],
            //设置高亮文字颜色
            primaryColor: Colors.red[100],
            //设置一般文字颜色
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: const TextStyle(color: Colors.yellow))),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentindex,
            onTap: (int index) {
              setState(() {
                _currentindex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.account_balance),
                label: '首页',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.format_list_bulleted),
                label: '分类',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt),
                label: '经典',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.help_outline_outlined),
                label: '知识',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity),
                label: '关于',
              ),
            ]),
      ), //backgroundColor: Colors.black,

//==============================

      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              //用户信息栏
              accountName: Text("按病选药自己当医生",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  )),
              accountEmail: Text(
                "13692277450@139.com",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                //头像
                backgroundImage: AssetImage('images/chenpi.png'),
              ),
              otherAccountsPictures: const <Widget>[
                //其他账号头像
                CircleAvatar(
                  backgroundImage: AssetImage('images/background.png'),
                ),
              ],
              onDetailsPressed: () {}, //下拉箭头
              decoration: BoxDecoration(
                //背景图片
                image: DecorationImage(
                    image: AssetImage('images/background1.png'),
                    fit: BoxFit.fill //图片不变性裁剪居中显示
                    ),
              ),
            ),
            ListTile(
              title: Text("主    页"),
              leading: CircleAvatar(child: Icon(Icons.home_max_rounded)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Tabs(), maintainState: false));
              },
            ),
            const Divider(),
            ListTile(
              title: Text("感冒中暑瘟疫类疾病"),
              leading: CircleAvatar(child: Icon(Icons.people)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataCold);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("头部类疾病"),
              leading:
                  CircleAvatar(child: Icon(Icons.health_and_safety_rounded)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataHead);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("关节系统诸病"),
              leading: CircleAvatar(
                  child: Icon(
                Icons.directions_walk_rounded,
              )),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataArthrosis);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("血液系统诸病"),
              leading: CircleAvatar(child: Icon(Icons.medication_rounded)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataBlood);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("身体平衡失调诸病"),
              leading:
                  CircleAvatar(child: Icon(Icons.accessible_forward_rounded)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataBodyLess);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("口腔咽喉诸病"),
              leading: CircleAvatar(child: Icon(Icons.mouse)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataMouse);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("糖尿病诸病"),
              leading: CircleAvatar(child: Icon(Icons.medication_rounded)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataDiabetes);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("听力系统诸病"),
              leading: CircleAvatar(child: Icon(Icons.earbuds_rounded)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataEar);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("眼睛诸病"),
              leading: CircleAvatar(child: Icon(Icons.medication_rounded)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataEyes);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("跌打损伤诸病"),
              leading:
                  CircleAvatar(child: Icon(Icons.accessible_forward_rounded)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataFalldown);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("儿童成长时期诸病"),
              leading: CircleAvatar(child: Icon(Icons.child_care_rounded)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataGrown);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("心脏系统诸病"),
              leading: CircleAvatar(child: Icon(Icons.favorite_border_rounded)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataHeart);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("热毒上火诸病"),
              leading: CircleAvatar(child: Icon(Icons.medication_rounded)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataHot);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("肠道系统诸病"),
              leading: CircleAvatar(child: Icon(Icons.medication_rounded)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataIntestines);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      endDrawer: Container(
        //显示右侧 侧边栏
        width: 200, //显示侧边栏的宽度
        color: Colors.white, //背景颜色
        child: ListView(
          children: <Widget>[
            //一些布局样式
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  image: DecorationImage(
                      image: AssetImage('images/background4.png'),
                      //   image: Image.asset('images/aizhi.png'),
                      fit: BoxFit.cover)),
              child: ListView(
                children: const <Widget>[
                  Text(
                    '中医乃中华文明瑰宝，必将永世流传！',
                    textAlign: TextAlign.end,
                  )
                ],
              ),
            ),
            const Divider(),
            ListTile(
              title: Text("心神不宁诸病"),
              leading:
                  CircleAvatar(child: Icon(Icons.favorite_outline_rounded)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataNoQuiet);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("疼痛类诸病"),
              leading: CircleAvatar(child: Icon(Icons.medication_rounded)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataPain);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("泌尿系统诸病"),
              leading: CircleAvatar(child: Icon(Icons.medication_rounded)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataPiss);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("皮肤科诸病"),
              leading: CircleAvatar(child: Icon(Icons.handyman_rounded)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataSkin);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("神经系统诸病"),
              leading: CircleAvatar(child: Icon(Icons.medication_rounded)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataThink);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("中风瘫痪类诸病"),
              leading: CircleAvatar(child: Icon(Icons.accessible)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataStroke);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("中毒类诸病"),
              leading: CircleAvatar(child: Icon(Icons.medication_rounded)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataToxicant);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("瘰疬结节结核肿块诸病"),
              leading: CircleAvatar(child: Icon(Icons.medication_rounded)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataTumor);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("胃部诸病"),
              leading: CircleAvatar(child: Icon(Icons.medication_rounded)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataStomach);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("肝胆系统诸病"),
              leading: CircleAvatar(child: Icon(Icons.medication_rounded)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataLiver);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("呼吸系统诸病"),
              leading: CircleAvatar(child: Icon(Icons.medication_rounded)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataLung);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("男性诸病"),
              leading: CircleAvatar(child: Icon(Icons.people)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataMan);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("女性诸病"),
              leading: CircleAvatar(child: Icon(Icons.people)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataWoman);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: Text("癌症肿瘤诸病"),
              leading: CircleAvatar(child: Icon(Icons.medication_rounded)),
              onTap: () {
                context.read<CountModle>().add();
                sort_page sp2 = sort_page();
                sp2.setIndex(listDataCancer);
                setState(() {
                  _currentindex = 1;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
