import 'package:chinamedicine2/pages/countmodle.dart';
import 'package:flutter/material.dart';
import 'package:chinamedicine2/main.dart';
import 'package:flutter/rendering.dart';
import 'tabs.dart';
import '../res/alldartOnefile.dart';
import '../res/Arthrosis.dart';
import 'dart:async';
import 'routes.dart';
import '../res/Head.dart';
import '../res/Blood.dart';
import '../res/Cold.dart';
import '../res/Cancer.dart';
import 'package:provider/provider.dart';
import 'countmodle.dart';
import 'dart:ui';
import 'package:flutter_swiper/flutter_swiper.dart';

bool isActive = false;
List listindex = listDataHead;

class sort_pageX extends StatefulWidget {
  const sort_pageX({Key? key}) : super(key: key);

  @override
  _sort_pageXState createState() => _sort_pageXState();
}

class _sort_pageXState extends State<sort_pageX> {
  //final GlobalKey<_sort_pageState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner:
    false;

    return Stack(
      children: <Widget>[
        Container(
          child: topswiper(),
        ),
        Divider(),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: sort_page(),
        ),
      ],
    );
  }
}

class sort_page extends StatefulWidget {
  @override
  _sort_pageState createState() => _sort_pageState();
  setIndex(var listinput) {
    if (listindex.isEmpty) {
      listindex = listDataHead;
    } else {
      listindex = listinput;
    }
    //print(listindex);
    return (listinput);
  }
}

class _sort_pageState extends State<sort_page> {
  final GlobalKey<_sort_pageState> key1 = GlobalKey();

  List<Widget> _getListData() {
    var tempList = listindex.map((value) {
      return LimitedBox(
        maxHeight: 605,
        child: Container(
          // padding: EdgeInsets.all(10),
          // height: 120,

          child: ListTile(
            isThreeLine: true,
            // leading: const Icon(
            //   Icons.medication_outlined,
            //   color: Colors.blue,
            //   size: 50,
            // ),
            title: Text('\n疾病名称：' + value["illsort"],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('疾病细分类别：' + value["illsortdetails"]),
                Text('药名：' + value["title"],
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('组成：' + value["material"]),
                Text('类型：' + value["model"]),
                Text('功能：' + value["function"]),
                Text('用量：' + value["qty"]),
                Text('注意：' + value["attention"],
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('规格：' + value["spec"]),
                Text('保存：' + value["store"]),
                Visibility(
                  child: Text("Count ${context.watch<CountModle>().count}"),
                  visible: false,
                ),
                SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
          //),

          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/sortbottom.png'),

                //  filterQuality: FilterQuality.low,
                fit: BoxFit.fill,
                //fit: BoxFit.cover,
                // centerSlice: Rect.fromLTRB(0.0, 0.0, 1360.0, 730.0),
                // scale: 0.5,
                centerSlice: Rect.fromCenter(
                    center: Offset(0, 0), width: 800, height: 800),
                // colorBlendMode: BlendMode.color,
              ),
              boxShadow: const [
                // ignore: prefer_const_constructors
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 8.0),
                  blurRadius: 0.2,
                  spreadRadius: 0.3,
                ),
              ],
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: Color.fromRGBO(23, 23, 23, 20),
                width: 0.0,
              ),
              color: Colors.grey,
              gradient: LinearGradient(
                  colors: const [Colors.grey, Colors.white],
                  begin: Alignment.centerRight,
                  end: Alignment(1, 0.0),
                  tileMode: TileMode.clamp)),
        ),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 20.0,
      mainAxisSpacing: 10.0,
      padding: EdgeInsets.all(10),
      crossAxisCount: 1,
      //childAspectRatio: 0.7,
      children: _getListData(),
    );
  }
}

class topswiper extends StatefulWidget {
  topswiper({Key? key}) : super(key: key);

  @override
  _topswiperState createState() => _topswiperState();
}

class _topswiperState extends State<topswiper> {
  List l = [
    "人命至重，有贵千金，一方济之，德逾于此。唐·孙思邈！\n进则救世，退则救民。东汉·张仲景。\n不为良相，亦为良医。范仲淹。",
    "中药炮制是指在中医理论的指导下，按中医用药要求将中药材加工成中药饮片的传统方法和技术，古时又称“炮炙”、“修事”、“修治”。药物经炮制后，不仅可以提高药效、降低药物的毒副作用，而且方便存储，是中医临床用药的必备工序。",
    "《五十二病方》是中国最早始有炮制内容记载的医方书，书中包括了净制、切制、水制、火制、水火共制等炮制内容，并有具体操作方法的记载，如“取商牢（陆）渍醯（醋）中”；“陈藿，蒸而取其汁”等。",
    "《雷公炮炙论》是中国第一部炮制专著。记述了如拣、去甲土、去粗皮、去节并沫、揩、拭、刷、刮、削、剥等净制操作；切、锉、擘、捶、舂、捣、研、杵、磨、水飞等切制操作；拭干、阴干、风干、晒干、焙干、炙干、蒸干等干燥方法；浸、煮、煎、炼、炒、熬、炙、焙、炮、煅等水火制法；苦酒浸、蜜涂炙、同糯米炒、酥炒、麻油煮、糯泔浸、药汁制等法。",
    "宋代炮制方法有很大改进，炮制目的也多样化了，开始从减少副作用到增加和改变疗效，从汤剂饮片的炮制而同时重视制备成药饮片炮制的崭新阶段。",
    "1979年首次编写出全国高等医药院校《中药炮制学》统一试用教材，\n1985年出版二版教材，1996年出版三版规划教材，\n2001年出版全国高等医药院校中医药系列教材《中药炮制学》，\n这为继承和发扬中药炮制学奠定了良好的基础。",
    "中药材必须经过炮制，制成中药饮片之后才能入药，这是中医临床用药的一个特点，也是中医药的一大特色。中药炮制技术是根据中医药理论，\n按照中医医疗、中药调配以及中药制剂的不同需要，结合药材自身性质，将中药材制成中药饮片的一整套制药技术。",
    "中药炮制是根据中医药理论和医疗、调剂、贮藏等不同要求以及药材自身的性质，分别采用修治、水制、火制及增添辅料制作等方法，对生药进行加工的特殊技术，其上可追溯到药材的种植、采集或饲养，其中以炒、炙、烫、煅、煨和火制方法最为常用，故名“炮制”。",
    "中药化学成分复杂，是中药发挥临床治疗作用的主要物质基础。\n中药经过各种的加工炮制，可使其化学成分发生变化，\n某些成分含量的增加或减少、成分种类的增加或减少等，均会影响药物的疗效。",
    "从秦汉到唐宋，从近代到现代，中药炮制从未停下自己发展与进步的脚步。这背后蕴藏的，不仅是传统医药文化强大的生命力，更是一代代传统医药匠人的坚韧意志和不屈精神。",
    " 中医中药可以说是中华发展历史长河上摧残至极的一抹，但如今却没落了，让人痛心无比。也因此，我们应当从新了解它，从新接纳它，更好的传承它。",
    "百年陈皮，俗话说“一两陈皮一两金”、“千年人参，百年陈皮”，陈皮是不可多得的药食茶同源、食养俱佳的中药材，广东十大药材之一，也被称为天下第一和药。其药用价值不言而喻。",
    "九蒸九晒，在古书中又称为九蒸九曝或九制，是一种有数千年传统历史的中药炮制方法，一般用医制作叫珍贵的药材。九蒸九晒，利用最纯粹的阳光（阳之气）来蒸晒那些本就吸收了天地精华的珍贵药材，这样纯粹的阴阳反复，循环处理，让阴阳二气能够和合、循环，大大提升了药材的药性和功效。",
    "炮制对升降浮沉的影响药物经炮制后，可改变其作用趋向，如酒制引药上行，盐炙引药下行入肾经。炮制对归经的影响中药炮制很多都是以归经理论作指导的，特别是用某些辅料炮制药物，如醋制入肝经，蜜制入脾经，盐制入肾经等。",
    "炮制对四气五味的影响①通过“反制”纠正药物过偏之性，以缓和药性。如栀子姜汁制后，能降低苦寒之性，以免伤中；通过“从制”，使药物的性味增强，增强疗效。如胆汁制黄连，增强黄连苦寒之性，所谓热者益热；通过炮制，改变药性，扩大药物的用途。如天南星辛温，善于燥湿化痰，祛风止痉。",
    "药物的炮制方法是根据药物的性质和治疗的需要而定的。药物的性质决定了药物的理化作用。不同的炮制方法和加入不同的辅料，对药物的理化性质和治疗作用有着不同的影响。中药经过炮制以后，由于温度、时间、溶剂以及不同辅料的处理，使其所含的成分产生不同的变化。",
    "加热是中药炮制的重要手段，其中炒制、煅制应用广泛。许多中药经炒制后，可杀酶保苷，如芥子，牛蒡子等；煅制常用于处理矿物药，动物甲壳及化石类药物，能使质脆易碎，而且作用也会发生变化。如白矾煅后燥湿、收敛作用增强。血余煅炭后能止血。川乌、草乌加热煮制后，其毒性显著降低，保证了临床用药安全有效。",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Card(
            // height: 40.0,

            color: Colors.cyan[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            // 抗锯齿
            clipBehavior: Clip.antiAlias,
            elevation: 20,
            // 阴影大小
            child: Container(
                height: 80,
                alignment: Alignment.bottomCenter,
                child: Center(
                    child: Swiper(
                  // autoplayDisableOnInteraction: true,
                  // itemWidth: double.infinity,
                  //containerHeight: 40,
                  //itemHeight: 40,
                  autoplayDelay: 6000,
                  itemCount: l.length, // 对象个数
                  loop: true, // 允许循环播放
                  autoplay: true, // 允许自动播放
                  scrollDirection: Axis.horizontal, // 滚动方向设置为水平
                  duration: 1000, // 执行时长
                  itemBuilder: (BuildContext context, int index) {
                    return Text(
                      l[index],
                      style: TextStyle(fontSize: 14, color: Colors.white70),
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.ltr,
                    );
                  },
                )))));
  }
}



//====================






//========================

// class showpopupmenubutton extends StatefulWidget {
//   showpopupmenubutton({Key? key}) : super(key: key);

//   @override
//   _showpopupmenubuttonState createState() => _showpopupmenubuttonState();
// }

// class _showpopupmenubuttonState extends State<showpopupmenubutton> {
//   @override
//   Widget build(BuildContext context) {
//   //  return _showPopupMenuButton();
  

//   PopupMenuButton _showPopupMenuButton() {
//     return PopupMenuButton(
//         icon: Icon(
//           Icons.album,
//           color: Colors.lightBlueAccent.shade200,
//         ),
//         color: Colors.yellowAccent[50],
//         elevation: 8.0,
//         padding: const EdgeInsets.all(8.0),
//         iconSize: 60,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//           side: BorderSide(
//             width: 2,
//             color: Colors.blueAccent,
//             style: BorderStyle.solid,
//           ),
//         ),
//         itemBuilder: (BuildContext context) => [
//               const PopupMenuItem(                
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("头部疾病"),
                  
//                 ),
                
//                 onTap:(),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("胃部疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("肠道疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("热毒上火疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("口腔咽喉疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("肝脏胆囊疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("心脏系统疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("呼吸系统疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("身体亏虚疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("血液系统疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("泌尿系统疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("糖尿病疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("心神不宁疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("中风瘫痪疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("女性疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("男性疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("感冒中暑疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("跌打损伤疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("关节系统疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("皮肤类疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("小儿发育成长疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("眼科类疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("神经系统疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("听力系统疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("瘰疬结节结核肿块疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("中毒解毒疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("癌症肿瘤疾病"),
//                 ),
//               ),
//               const PopupMenuItem(
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.medical_services_outlined,
//                     color: Colors.blueAccent,
//                   ),
//                   title: Text("其它疼痛类疾病"),
//                 ),
//               ),
//             ]);
//   }
// }
// }