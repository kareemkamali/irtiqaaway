import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import  'package:flutter_localizations/src/material_localizations.dart';
import 'Responsive/SizeConfig.dart';
import 'Screens/About_us_Screen.dart';
import 'Screens/BathMoubashar.dart';
import 'Screens/Call_us_screen.dart';
import 'Screens/HomePage.dart';
import 'Screens/Player.dart';
import 'Screens/Praying_time.dart';
import 'Screens/Qibla.dart';
import 'Screens/takwim.dart';
import 'Utils/Utils.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context,constraints){
        return OrientationBuilder(builder:
            (context,orientation){
          SizeConfig().init(constraints, orientation);
          return MaterialApp(

            localizationsDelegates: [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [
              Locale("ar", "AR"),
            ],
            locale: Locale("ar", "AR"),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: MyHomePage(),
          );
        }

        );
      },

    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int index =0;
  List<Widget> list = [
    HomePage(),
    Players(),
    PrayingTimeScreen(),
    QiblahScreen(),
    AboutUsScreen(),
    CallUsScreen(),
    BathMobashar(),
    // QiblahScreen(),
    // AboutUsScreen(),
    // CallUsScreen(),
     Calender(),

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("ar", "AR"),
      ],
      locale: Locale("ar", "AR"),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 10*SizeConfig.heightMultiplier,
          backgroundColor: Color.fromRGBO(40, 123, 175, 1.0),

          title: Text(
            index==0?
            "اذاعة طريق الارتقاء":index==1?"اذاعة طريق الارتقاء\n-اذاعات":index==2?" اذاعة طريق الارتقاء\n- مواقيت الصلاة":index==3?"اذاعة طريق الارتقاء\n-اتجاه القبله":index==4?"اذاعة طريق الارتقاء\n-من نحن":index==5?"اذاعة طريق الارتقاء\n-اتصل بنا":index==7?"اذاعة طريق الارتقاء\n-التقويم":"اذاعة طريق الارتقاء\n-لايف ",

            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 2*SizeConfig.textMultiplier,fontWeight: FontWeight.bold),
          ),
          actions: [
            Row(
              children: [

                index==0?
                Icon(FontAwesomeIcons.home, size:10*SizeConfig.imageSizeMultiplier,):index==1?Icon(Icons.radio,size:10*SizeConfig.imageSizeMultiplier):index==2?Icon(Icons.wb_sunny, size:10*SizeConfig.imageSizeMultiplier):index==3?Icon(FontAwesomeIcons.compass,size:10*SizeConfig.imageSizeMultiplier):index==4?Icon(Icons.info_rounded,size:10*SizeConfig.imageSizeMultiplier):index==5?Icon(Icons.call,size:10*SizeConfig.imageSizeMultiplier):index==7?Icon(Icons.date_range_sharp,size:10*SizeConfig.imageSizeMultiplier,):Padding(
                  padding:  EdgeInsets.only(left:3*SizeConfig.widthMultiplier),
                  child: Icon(FontAwesomeIcons.tv,size:10*SizeConfig.imageSizeMultiplier,),
                ),

              ],
            )

          ],

        ),







        body: list[index],
        drawer: MyDrawer(onTap: (ctx, i) {
          setState(() {
            index = i;
            Navigator.pop(ctx);
          });
        }),
      ),
    );
  }

  @override
  void initState() {

    // print(DateTime.now());
  }
}

class MyDrawer extends StatelessWidget {
  final Function onTap;

  MyDrawer({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(40, 123, 175, 1.0),
            ),
            child: Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/images/logo.jpeg",
                      // width:40*SizeConfig.imageSizeMultiplier ,
                      height: 25*SizeConfig.imageSizeMultiplier,
                    ),


                    // radius: 50,
                  ),
                  // SizedBox(height: MediaQuery.of(context).size.height*0.01),
                  Text(
                    "اذاعة طريق الارتقاء",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () => onTap(context,0),
            title: Container(
              height: 40,
              decoration: BoxDecoration(
                  border:
                  Border(bottom: BorderSide(color: Colors.grey.shade600))),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.home,
                      color: Color.fromRGBO(40, 123, 175, 1.0),
                    ),
                  ),
                  Text(
                    "الرئيسية",
                    style: TextStyle(
                      color: Color.fromRGBO(40, 123, 175, 1.0),
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
            ),
          ),

          ListTile(
            onTap: () => onTap(context, 1),
            title: Container(
              height: 40,
              decoration: BoxDecoration(
                  border:
                  Border(bottom: BorderSide(color: Colors.grey.shade600))),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.radio,
                      color: Color.fromRGBO(40, 123, 175, 1.0),
                    ),
                  ),
                  Text(
                    "الاذاعات",
                    style: TextStyle(
                      color: Color.fromRGBO(40, 123, 175, 1.0),
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
            ),
          ),


          ListTile(
            onTap: () => onTap(context, 6),
            title: Container(
              height: 40,
              decoration: BoxDecoration(
                  border:
                  Border(bottom: BorderSide(color: Colors.grey.shade600))),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      FontAwesomeIcons.tv,
                      color: Color.fromRGBO(40, 123, 175, 1.0),
                    ),
                  ),
                  Text(
                    "بث مباشر",
                    style: TextStyle(
                      color: Color.fromRGBO(40, 123, 175, 1.0),
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
            ),
          ),


          ListTile(
            onTap: () => onTap(context, 2),
            title: Container(
              height: 40,
              decoration: BoxDecoration(
                  border:
                  Border(bottom: BorderSide(color: Colors.grey.shade600))),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.wb_sunny,
                      color: Color.fromRGBO(40, 123, 175, 1.0),
                    ),
                  ),
                  Text(
                    "مواقيت الصلاة",
                    style: TextStyle(
                      color: Color.fromRGBO(40, 123, 175, 1.0),
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () => onTap(context,7),
            title: Container(
              height: 40,
              decoration: BoxDecoration(
                  border:
                  Border(bottom: BorderSide(color: Colors.grey.shade600))),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.date_range_sharp,
                      color: Color.fromRGBO(40, 123, 175, 1.0),
                    ),
                  ),
                  Text(
                    "التقويم",
                    style: TextStyle(
                      color: Color.fromRGBO(40, 123, 175, 1.0),
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
            ),
          ),



          ListTile(
            onTap: () => onTap(context, 3),
            title: Container(
              height: 40,
              decoration: BoxDecoration(
                  border:
                  Border(bottom: BorderSide(color: Colors.grey.shade600))),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(11, 8, 8, 11),
                    child: Icon(
                      Icons.compass_calibration,
                      color: Color.fromRGBO(40, 123, 175, 1.0),
                    ),
                  ),
                  Text(
                    "اتجاه القبلة",
                    style: TextStyle(
                      color: Color.fromRGBO(40, 123, 175, 1.0),
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () => onTap(context, 4),
            title: Container(
              height: 40,
              decoration: BoxDecoration(
                  border:
                  Border(bottom: BorderSide(color: Colors.grey.shade600))),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.info,
                      color: Color.fromRGBO(40, 123, 175, 1.0),
                    ),
                  ),
                  Text(
                    "من نحن",
                    style: TextStyle(
                      color: Color.fromRGBO(40, 123, 175, 1.0),
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () => onTap(context, 5),
            title: Container(
              height: 40,
              decoration: BoxDecoration(
                  border:
                  Border(bottom: BorderSide(color: Colors.grey.shade600))),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.phone,
                      color: Color.fromRGBO(40, 123, 175, 1.0),
                    ),
                  ),
                  Text(
                    "اتصل بنا",
                    style: TextStyle(
                      color: Color.fromRGBO(40, 123, 175, 1.0),
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title:


            Container(
              child: Column(
                children: [
                  Text("تواصل معنا عبر",textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(40, 123, 175, 1.0),

                  ),
                  ),
                  Divider(height:MediaQuery.of(context).size.height*0.01,color:Colors.grey.shade600,thickness:2,)
                  ,
                  Column(

                    children: [
                      Row(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          IconButton(onPressed: (){ Utils.openLink(
                              url:
                              'https://www.facebook.com/irtiqaa.way/?ti=as');},
                              icon:Icon(FontAwesomeIcons.facebook),color: Colors.blue,iconSize: 30),
                          IconButton(onPressed: (){
                            Utils.openLink(
                                url:
                                'https://chat.whatsapp.com/FR9UkeUYRoH2oqhmKezayE');
                          }, icon:Icon(FontAwesomeIcons.whatsapp),color: Colors.green,iconSize: 30,),
                          IconButton(onPressed: (){
                            Utils.openLink(
                                url: 'https://t.me/irtiqaaway');
                          },

                            icon:Icon(FontAwesomeIcons.telegram),color: Colors.blue[400],iconSize: 30,),
                          IconButton(onPressed: (){
                            Utils.openLink(
                                url:
                                'https://www.instagram.com/irtiqaawayradio/');
                          }, icon:Icon(FontAwesomeIcons.instagram),color: Colors.pink,iconSize: 30,),

                        ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: (){  Utils.openLink(
                              url:
                              'https://twitter.com/irtiqaaway?s=09');},
                            icon:Icon(FontAwesomeIcons.twitter),color: Colors.blue,iconSize: 30,),

                          IconButton(onPressed: (){
                            Utils.openLink(
                                url:
                                'https://youtu.be/sM0qRTSJgWs');
                          }, icon:Icon(FontAwesomeIcons.youtube),color: Colors.red,iconSize: 30,),
                        ],
                      ),
                    ],
                  )
                ],
              ),

            ),
          ),

        ],


      ),
    );
  }
}