import 'dart:async';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:ota_update/ota_update.dart';
import 'tabs.dart';

void main() => runApp(upgrade());

/// example widget for ota_update plugin
class upgrade extends StatefulWidget {
  @override
  _upgradeState createState() => _upgradeState();
}

class _upgradeState extends State<upgrade> {
  var status = null;
  var value = null;

  late OtaEvent currentEvent = OtaEvent(status, value);

  @override
  void initState() {
    super.initState();
    tryOtaUpdate();
  }

  Future<void> tryOtaUpdate() async {
    try {
      //LINK CONTAINS APK OF FLUTTER HELLO WORLD FROM FLUTTER SDK EXAMPLES
      OtaUpdate()
          .execute(
        'http://www.pavogroup.top/chinadoctor.apk',
        destinationFilename: 'chinadoctor.apk',
        //FOR NOW ANDROID ONLY - ABILITY TO VALIDATE CHECKSUM OF FILE:
        // sha256checksum:
        //   'bafc2a881056877b52650b442f5e8e9cb7ef7ffdb590a75c4a9060fa1b6f1213',
      )
          .listen(
        (OtaEvent event) {
          setState(() => currentEvent = event);
        },
      );

      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      print('对不起，安装更新失败，错误代码: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentEvent == null) {
      return Container();
    }
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          title: const Text('APP更新安装...'),
          leading: IconButton(
            iconSize: 24,
            icon: Icon(
              Icons.backspace_rounded,
              color: Colors.white,
              size: 24.0,
              semanticLabel: '返回',
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Tabs(), maintainState: false));
            },
          )),
      body: Center(
        // child: Container(
        child: Column(children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Image(
            image: AssetImage('images/upgradebar.gif'),
            filterQuality: FilterQuality.high,
            // fit: BoxFit.fill,
            // colorBlendMode: BlendMode.color,
          ),

          // Container(
          //     height: 15,
          //     child: LinearProgressIndicator(
          //       //double k = currentEvent.value,
          //       value: double.parse(currentEvent.value!) + 1,
          //       minHeight: 15,
          //       valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          //       backgroundColor: Colors.blue,
          //       //semanticsLabel: textlable,
          //       //semanticsValue: value,
          //       // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))
          //     )),
          SizedBox(
            height: 20,
          ),
          Text('请稍等，APP更新进行中,程序已经下载 : ${currentEvent.value} % \n'),
          SizedBox(
            height: 10,
          ),
          Text('感谢您的耐心等候，如果网络速度合适，更新大概需要两分钟。'),
          SizedBox(
            height: 10,
          ),
          Text('本次更新APP的服务器：www.pavogroup.top。'),
          Divider(),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 350,
            width: 350,
            child: Image(
              height: 350,
              width: 350,
              image: AssetImage('images/24jieqi.gif'),
              // filterQuality: FilterQuality.low,
              // fit: BoxFit.fill,
              // colorBlendMode: BlendMode.color,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //              '请稍等，APP更新进行中: ${currentEvent.status} : ${currentEvent.value}:% \n'),
        ]),
      ),
    ));
  }
}
