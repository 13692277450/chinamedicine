import 'dart:io';
import 'dart:ui';
import 'dart:async';
import 'dart:convert';

import 'package:url_launcher/url_launcher.dart';
import 'package:chinamedicine2/pages/upgrade.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chinamedicine2/main.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http.get(Uri.parse('http://www.pavogroup.top/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('对不起，连接APP更新服务器失败！');
  }
}

class Album {
  final String android_version;
  final String android_msg;
  // final String android_url;

  Album({
    required this.android_version,
    required this.android_msg,
    //  required this.android_url,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      android_version: json['android_version'],
      android_msg: json['android_msg'],
      //    android_url: json['android_url'],
    );
  }
}

class settings_pageX extends StatefulWidget {
  settings_pageX({Key? key}) : super(key: key);

  @override
  _settings_pageXState createState() => _settings_pageXState();
}

class _settings_pageXState extends State<settings_pageX> {
  late Future<Album> futureAlbum;
  var appversion = '';

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    // body:
    // Center(
    //     child: FutureBuilder<Album>(
    //   future: futureAlbum,
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       // if (snapshot.data!.android_version == "1.8.0") {
    //       //   _versionDialog(context);
    //       // } else {
    //       //   Navigator.pushNamed(context, '/upgrade');
    //       // }
    //       return Text('APP最新版本： ${snapshot.data!.title}');
    //     } else if (snapshot.hasError) {
    //       return Text('${snapshot.error}');
    //     }
    //     // By default, show a loading spinner.
    //     return const CircularProgressIndicator();
    //   },
    // ));

    return ListView(scrollDirection: Axis.vertical,
        //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 1, //每行显示3列
        //   childAspectRatio: 69 / 24, //显示区域宽高相等
        //   mainAxisSpacing: 2.0, //每行的间距
        //   crossAxisSpacing: 2.0, //每列的间距
        // ),
        children: <Widget>[
          Image(
            image: AssetImage('images/yangsheng.png'),
            //  filterQuality: FilterQuality.low,
            fit: BoxFit.fill,
            colorBlendMode: BlendMode.color,
          ),
          Divider(),
          Container(
            child: settings_details(),
          ),
          Divider(),
          Container(
            child: _buildTextRich(context),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(),
          FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                appversion = snapshot.data!.android_version;
                return Text(
                  'APP最新版本： ${snapshot.data!.android_version}. \n本次更新内容： ${snapshot.data!.android_msg} ',
                  //  textAlign: TextAlign.center,
                );
              } else if (snapshot.hasError) {
                return Text(
                  '正在连接服务器以检测是否有新版本.....',
                  // '${snapshot.error}',
                  textAlign: TextAlign.center,
                );
              }
              // By default, show a loading spinner.
              // return const CircularProgressIndicator();
              return Text('正在连接服务器以检测是否有新版本.....');
            },
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16)),
                backgroundColor: MaterialStateProperty.all(Color(0xFF93DFBB)),
                foregroundColor: MaterialStateProperty.all(Color(0xFF4B1BCF)),
                side: MaterialStateProperty.all(
                    BorderSide(width: 2, color: Color(0xFF4EA5DF))),
                shadowColor: MaterialStateProperty.all(Colors.grey),
                elevation: MaterialStateProperty.all(15),
                shape: MaterialStateProperty.all(StadiumBorder(
                    side: BorderSide(
                  //设置 界面效果
                  style: BorderStyle.solid,
                  color: Color(0xffFF7F24),
                  width: 20,
                ))),
              ),
              onPressed: () {
                if (appversion.length == 0) {
                  _checkfaileDialog(context);
                } else if (appversion == "1.9.0") {
                  _versionDialog(context);
                } else {
                  Navigator.pushNamed(context, '/upgrade');
                }
              },
              child: Text("更新APP到最新版本..."),
            ),
          ),
          Divider(),
          SizedBox(
            height: 20,
          ),
          Text(
            "扫一扫分享APP下载链接给好朋友...",
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 280,
            width: 200,
            child: Image(
              height: 280,
              width: 200,
              image: AssetImage('images/qrcode.png'),
              filterQuality: FilterQuality.low,
              fit: BoxFit.fill,
              colorBlendMode: BlendMode.color,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "支持孔雀软件开发更多的免费软件以造福人民:",
            textAlign: TextAlign.center,
            style: TextStyle(),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 280,
            width: 250,
            child: Image(
              height: 280,
              width: 250,
              image: AssetImage('images/getpay.png'),
              filterQuality: FilterQuality.low,
              fit: BoxFit.fill,
              colorBlendMode: BlendMode.color,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "APP当前版本 Ver 1.9.0. \n 公司网站： www.pavogroup.top  \n 版权所有：孔雀软件科技有限公司 @2021",
            textAlign: TextAlign.center,
            style: TextStyle(),
          ),
        ]);
  }
}

class settings_details extends StatelessWidget {
  const settings_details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.bottomCenter,
      child: ListTile(
          title: Text(
            "关于按病选药自己当医生APP",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Column(
            children: const <Widget>[
              Text(
                "\n" +
                    "本APP是基于现在流行的原生代码架构Flutter平台的Version2.5.3版本和Dart语言的Version3.9.0版本开发而成，医药数据来源于国家权威的《中国药典》2015版，各个中成药被按种类和治疗疾病的类型总共分为30个小类，在分类栏目里面可以点击APP顶部的菜单按钮即可选择相应的疾病来实现快速检索对应的中成药，对于患者来说及其方便快捷。本APP所参考的药品资料版权归《中国药典》所有，《按病选药自己当医生》PDF版本的文字书籍下载地址：www.pavogroup.top/files/chinadoctorbook.pdf。孔雀软件科技有限公司同时提供APP的外包开发业务，如果您有APP的开发需求，请与孔雀软件科技联系，联系邮箱：13692277450@139.com，联系人：张莽。更多详情和其它软件产品，请访孔雀软件公司网站。 我们将一如既往的为您提供最优质的软件产品和服务，感谢您对孔雀软件的大力支持! ",
                style: TextStyle(fontWeight: FontWeight.w400),
                textAlign: TextAlign.justify,
              )
            ],
          )),
    );
  }
}

Widget _buildTextRich(context) {
  return Container(
    //  alignment: Alignment.bottomCenter,
    padding: EdgeInsets.all(12.0),
    color: Colors.white,
    child: Form(
      //key: _globalKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            maxLines: 5,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(),
                ),
                labelText: "请输入您的建议：",
                labelStyle: TextStyle(color: Colors.green, fontSize: 20.0)),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "请输入手机号码"),
            onSaved: (value) {},
            //obscureText: true,
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            width: 150,
            height: 30,
            child: ElevatedButton(
              onPressed: () {
                _alertDialog(context);
              },
              child: Text("留   言"),
            ),
          )
        ],
      ),
    ),
  );
}

_alertDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          clipBehavior: Clip.antiAlias,
          elevation: 20,
          title: Text("留言成功"),
          content: Text("非常感谢您的留言，我们会尽快回复您。谢谢"),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("确  定"),
            ),
          ],
        );
      });
}

_versionDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          clipBehavior: Clip.antiAlias,
          elevation: 20,
          title: Text("APP版本更新"),
          content: Text("当前已经是最新版本了，无需更新。"),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("确  定"),
            ),
          ],
        );
      });
}

_checkfaileDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey,
          title: Text("APP版本更新"),
          content: Text("无法连接到服务器，请稍后再试或者访问官网。"),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("确  定"),
            ),
          ],
        );
      });
}
