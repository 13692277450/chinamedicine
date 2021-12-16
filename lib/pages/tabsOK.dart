import 'package:chinamedicine2/pages/newsPage.dart';
import 'package:flutter/material.dart';
import 'package:chinamedicine2/main.dart';
import 'home.dart';
import 'sortPage.dart';
import 'settingsPage.dart';
import 'knowledgePage.dart';
import '../res/Cold.dart';
import '../res/Head.dart';
import '../res/Blood.dart';
import '../res/Cancer.dart';

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
    news_pageX(),
    knowledge_page(),
    settings_pageX(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _listPage[_currentindex],
        appBar: AppBar(
          title: const Text('中国药典之中成药大全'),
//====================================================

          leading: Icon(Icons.home),
          backgroundColor: Colors.blue,
          centerTitle: true,
          actions: <Widget>[
            // 非隐藏的菜单
            IconButton(
                icon: Icon(Icons.add_alarm),
                tooltip: 'Add Alarm',
                onPressed: () {
                  sort_page sp2 = sort_page();
                  sp2.setIndex(listDataBlood);
                  //setIndex(listDataCold);
                  // key.currentState!.changeState();
                  //  Navigator.pushNamed(context, '/sort_page');

                  setState(() {
                    isActive = !isActive;

                    sp2.createState();
                  });

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => sort_page(),
                          maintainState: false));
                }),
            // 隐藏的菜单
            PopupMenuButton<String>(
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                SelectView(Icons.message, 'Blood', 'Blood'),
                SelectView(Icons.group_add, 'Cold', 'Cold'),
                SelectView(Icons.cast_connected, 'Cancer', 'Cancer'),
              ],
              onSelected: (String action) {
                // 点击选项的时候
                switch (action) {
                  case 'Blood':
                    sort_page sp2 = sort_page();

                    sp2.setIndex(listDataBlood);
                    // Navigator.pushNamed(context, '/sort_page');

                    //setIndex(listDataCold);
                    // key.currentState!.changeState();
                    setState(() {
                      isActive = !isActive;

                      sp2;
                    });
                    break;
                  case 'Cold':
                    sort_page sp2 = sort_page();
                    sp2.setIndex(listDataCold);
                    // Navigator.pushNamed(context, '/sort_page');

                    //setIndex(listDataCold);
                    //key.currentState!.changeState();
                    setState(() {
                      isActive = !isActive;

                      sp2;
                    });
                    break;
                  case 'Cancer':
                    sort_page sp2 = sort_page();
                    isActive = !isActive;
                    sp2.createState();
                    break;
                }
              },
            ),
          ],

//========================================================
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              //设置背景色`BottomNavigationBar`
              canvasColor: Colors.green[200],
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
                  label: '新闻',
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
        ) //backgroundColor: Colors.black,
        //============

        );
  }
}

SelectView(IconData icon, String text, String id) {
  return PopupMenuItem<String>(
      value: id,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(icon, color: Colors.blue),
          Text(text),
        ],
      ));
}
