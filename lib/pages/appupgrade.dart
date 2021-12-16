// import 'dart:io';
// import 'dart:js';

// import 'package:dio/dio.dart';
// import 'package:flutter/services.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:package_info/package_info.dart';
// import 'package:ota_update/ota_update.dart';
// import 'dart:convert';
// import 'package:io/io.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:path_provider/path_provider.dart';

// //获取版本号
// _getPackageInfo() async {
//   PackageInfo packageInfo = await PackageInfo.fromPlatform();
//   String appName = packageInfo.appName;
//   String packageName = packageInfo.packageName;
//   String version = packageInfo.version;
//   String buildNumber = packageInfo.buildNumber;

//   api.getData(context, 'update').then((val) {
//     print('-------------获取版本信息--------------');
//     var response = json.decode(val.toString());
//     // 如果当前版本比服务器小，返回-1，大返回1，相等返回0
//     var isUpdate = version.compareTo(response['version_no']);

//     setState(() {
//       app_url = '$base_url${response['app_path']}';
//     });
//     // 如果版本低于服务器版本就显示更新提示
//     if (isUpdate.toString() == '-1') {
//       _showDialog();
//     }
//   });

//   print("App名称:${appName}");

//   print("包名:${packageName}");

//   print("version:${version}");

//   print("打包次数:${buildNumber}");
// }

// //下载并打开文件
// _downLoad() async {
//   // 获取APP安装路径
//   Directory appDocDir = await getApplicationDocumentsDirectory();
//   String appDocPath = appDocDir.path;

//   if (Platform.isIOS) {
//     String url =
//         'itms-apps://itunes.apple.com/cn/app/id414478124?mt=8'; //到时候换成自己的应用的地址
//     // 通过url_launcher插件来跳转AppStore
//     // if (await canLaunch(url)){
//     //   await launch(url);
//     // }else {
//     //   throw 'Could not launch $url';
//     // }
//   } else if (Platform.isAndroid) {
//     String url = app_url;
//     // String url = "http://www.ionic.wang/jdshop.apk";
//     print(url);
//     try {
//       OtaUpdate().execute(url).listen(
//         (OtaEvent event) {
//           print('status:${event.status},value:${event.value}');
//           switch (event.status) {
//             case OtaStatus.DOWNLOADING: // 下载中
//               setState(() {
//                 progress = '下载进度:${event.value}%';
//               });
//               break;
//             case OtaStatus.INSTALLING: //安装中
//               print('-----安装中----');
//               // 打开安装文件
//               //这里的这个Apk文件名可以写，也可以不写
//               //不写的话会出现让你选择用浏览器打开，点击取消就好了，写了后会直接打开当前目录下的Apk文件，名字随便定就可以
//               OpenFile.open("${appDocPath}/new.apk");
//               break;
//             case OtaStatus.PERMISSION_NOT_GRANTED_ERROR: // 权限错误
//               print('更新失败，请稍后再试');

//               break;
//             default: // 其他问题
//               break;
//           }
//         },
//       );
//     } catch (e) {
//       print('更新失败，请稍后再试');
//     }
//   }
// }
