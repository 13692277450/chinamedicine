import 'package:mysql1/mysql1.dart';
import 'dart:async';

Future Database() async {
  var conn = await MySqlConnection.connect(ConnectionSettings(
    host: '108.166.105.86',
    port: 3306,
    user: 'root',
    db: 'news',
    password: '86868686mM',
  ));
  //await conn.query("select * form news") ;
  var result = await conn.query("select * from news");
  // await conn.close();
  //   setState(() {
  //   newsList = result.toList();
  // });

  // @override
  // void initState() {
  //   super.initState();
  //   Database();
  // }
}
