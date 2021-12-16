// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       appBar: AppBar(title: const Text('中医世家')),
//       // theme:  ThemeData(
//       //   primaryColor: const Color(0xFF2196f3),
//       //   canvasColor: const Color(0xFFfafafa),
//       //   colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(secondary: const Color(0xFF2196f3)),
//       // ),
//       //home: MyHomePage(),
//       //body: HomeContent(),
//       bottomNavigationBar: HomeContent(),
//     ));
//   }
// }

// class HomeContent extends StatelessWidget {
//   // const HomeContent({Key? key}) : super(key: key);
// //@override
//   List<Widget> _getData() {
//     var tempList = listData.map((value) {
//       return ListTile(
//         leading: const Icon(Icons.medical_services_sharp, color: Colors.blue),
//         title: Text('药名：' + value["title"]),
//         subtitle: Text('药方：' + value["material"]),
//         // subtitle: Text(value["material"]),
//         // subtitle: Text(value["model"]),
//         // subtitle: Text(value["function"]),
//         // subtitle: Text(value["qty"]),
//         // subtitle: Text(value["spec"]),
//         // subtitle: Text(value["store"])
//       );
//     });
//     return tempList.toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: _getData(),
//     );
//   }

// //   @override
// //   Widget build(BuildContext context){
// //     return Container(
// //        child: <Widget> Card(
// //   color: Colors.blue,
// //   elevation: 20.0,
// //   shadowColor: Colors.red,
// //   child: Padding(
// //     padding: EdgeInsets.all(30.0),
// //     child: Text('FLUTTER CARD'),
// //   ),
// // )

// }
