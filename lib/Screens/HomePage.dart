import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:irtiqaawaybykareem/Module/FastNew.dart';
import 'package:irtiqaawaybykareem/Responsive/Responsive_widget.dart';
import 'package:irtiqaawaybykareem/Responsive/SizeConfig.dart';
import 'package:irtiqaawaybykareem/Services/CallApi.dart';
import 'package:irtiqaawaybykareem/Utils/Utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(22, 34, 56, 1),
          body: Stack(
            children: [
              ResponsiveWidget(
                portraitLayout: potraitHomeScreen(),
                landscapeLayout: LandScapeHomeScreen(),
              )
            ],
          ),
        )
    );
  }
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}














class potraitHomeScreen extends StatefulWidget {
  const potraitHomeScreen({
    Key ?key,
  }) : super(key: key);

  @override
  State<potraitHomeScreen> createState() => _potraitHomeScreenState();
}

class _potraitHomeScreenState extends State<potraitHomeScreen> {
  @override
  bool loading=true;
  void initState() {
    // TODO: implement initState
    super.initState();
    _getFastNews();
  }

  var Fastnews=<FastNews>[];
  _getFastNews() async {
    await CallApi()
        .getArticleData('/wp-json/wp/v2/posts?per_page=100&categories=1667')
        .then((response) {
      Iterable list = json.decode(response.body);
      setState(() {
        loading=false;
      });
      Fastnews = list.map((model) => FastNews.fromJson(model)).toList();

    });

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height:110*SizeConfig.imageSizeMultiplier,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/tenYearsBackground.jpeg'),
                fit: BoxFit.fill,
              )),
        ),
     loading?Container(child: Text("wait..."),):
     Column(
          children: [
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: Center(
                child: Text(' عاجل',style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width*0.05,
color: Colors.white
                ),
                ),
              ),

            ),
            Container(
              width: MediaQuery.of(context).size.width/1.2,
              child: AnimatedTextKit(animatedTexts: [

                for (int i=0;i<5;i++)...{
                  TyperAnimatedText(
                    Fastnews[i].title.replaceAll(
                        RegExp(
                            r'<[^>]*>|&[^;]+;'),
                        ' ')
                    ,textStyle: TextStyle(
                    fontSize:15,
                    fontFamily: 'Bobbers',
                    overflow: TextOverflow.fade,

color: Colors.white


                  ),speed: Duration(milliseconds:100),


                  ),
                }


              ],
                totalRepeatCount: 5,
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,

              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(color: Color.fromRGBO(21, 34, 56, 1)),

          height: (MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top) *
              0.155,
          width: double.infinity,
          //margin: EdgeInsets.only(bottom: 500),
          //padding: EdgeInsets.only(bottom: 700),
          child: new Padding(
            padding: EdgeInsets.all(5.0),
            //padding: EdgeInsets.only(bottom: 10),
            child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Center(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new Container(
                            height: 45.0,

                            // height: 45.0,
                            width: 45.0,

                            child: Center(
                              child: Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      25.0), // half of height and width of Image
                                ),
                                child: IconButton(
                                    color: Color(0xFF162A49),
                                    onPressed: () {
                                      print('object');
                                      Utils.openLink(
                                          url:
                                          'https://youtu.be/sM0qRTSJgWs');
                                    },
                                    icon: new Icon(
                                      FontAwesomeIcons.youtube,
                                      size: 20.0,
                                    )),
                              ),
                            )),
                        new Container(
                          height: 45.0,
                          width: 45.0,
                          child: Center(
                            child: Card(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    25.0), // half of height and width of Image
                              ),
                              child: IconButton(
                                  color: Color(0xFF162A49),
                                  onPressed: () {
                                    Utils.openLink(
                                        url:
                                        'https://www.facebook.com/irtiqaa.way/?ti=as');
                                  },
                                  icon: new Icon(
                                    FontAwesomeIcons.facebook,
                                    size: 20.0,
                                  )),
                            ),
                          ),
                        ),
                        new Container(
                            height: 45.0,
                            width: 45.0,
                            child: Center(
                              child: Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      25.0), // half of height and width of Image
                                ),
                                child: IconButton(
                                    color: Color(0xFF162A49),
                                    onPressed: () {
                                      Utils.openLink(
                                          url: 'https://t.me/irtiqaaway');
                                    },
                                    icon: new Icon(
                                      FontAwesomeIcons.telegram,
                                      size: 20.0,
                                    )),
                              ),
                            )),
                        new Container(
                            height: 45.0,
                            width: 45.0,
                            child: Center(
                              child: Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      25.0), // half of height and width of Image
                                ),
                                child: IconButton(
                                    color: Color(0xFF162A49),
                                    onPressed: () {
                                      Utils.openLink(
                                          url:
                                          'https://chat.whatsapp.com/FR9UkeUYRoH2oqhmKezayE');
                                    },
                                    icon: new Icon(
                                      FontAwesomeIcons.whatsapp,
                                      size: 20.0,
                                    )),
                              ),
                            )),
                        new Container(
                            height: 45.0,
                            width: 45.0,
                            child: Center(
                              child: Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      25.0), // half of height and width of Image
                                ),
                                child: IconButton(
                                    color: Color(0xFF162A49),
                                    onPressed: () {
                                      Utils.openLink(
                                          url:
                                          'https://twitter.com/irtiqaaway?s=09');
                                    },
                                    icon: new Icon(
                                      FontAwesomeIcons.twitter,
                                      size: 20.0,
                                    )),
                              ),
                            )),
                        new Container(
                            height: 45.0,
                            width: 45.0,
                            child: Center(
                              child: Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      25.0), // half of height and width of Image
                                ),
                                child: IconButton(
                                  icon: new Icon(
                                    FontAwesomeIcons.instagram,
                                    size: 20.0,
                                  ),
                                  color: Color(0xFF162A49),
                                  onPressed: () {
                                    Utils.openLink(
                                        url:
                                        'https://www.instagram.com/irtiqaawayradio/');
                                  },
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
class LandScapeHomeScreen extends StatefulWidget {
  const LandScapeHomeScreen({
    Key ? key,
  }) : super(key: key);

  @override
  State<LandScapeHomeScreen> createState() => _LandScapeHomeScreenState();
}

class _LandScapeHomeScreenState extends State<LandScapeHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height:100*SizeConfig.imageSizeMultiplier,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/tenYearsBackground.jpeg'),
                  fit: BoxFit.fill,
                )),
          ),
          Container(
            decoration: BoxDecoration(color: Color.fromRGBO(21, 34, 56, 1)),

            height: (MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top) *
                0.155,
            width: double.infinity,
            //margin: EdgeInsets.only(bottom: 500),
            //padding: EdgeInsets.only(bottom: 700),
            child: new Padding(
              padding: EdgeInsets.all(5.0),
              //padding: EdgeInsets.only(bottom: 10),
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Center(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Container(
                              height: 45.0,

                              // height: 45.0,
                              width: 45.0,

                              child: Center(
                                child: Card(
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        25.0), // half of height and width of Image
                                  ),
                                  child: IconButton(
                                      color: Color(0xFF162A49),
                                      onPressed: () {
                                        print('object');
                                        Utils.openLink(
                                            url:
                                            'https://youtu.be/sM0qRTSJgWs');
                                      },
                                      icon: new Icon(
                                        FontAwesomeIcons.youtube,
                                        size: 20.0,
                                      )),
                                ),
                              )),
                          new Container(
                            height: 45.0,
                            width: 45.0,
                            child: Center(
                              child: Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      25.0), // half of height and width of Image
                                ),
                                child: IconButton(
                                    color: Color(0xFF162A49),
                                    onPressed: () {
                                      Utils.openLink(
                                          url:
                                          'https://www.facebook.com/irtiqaa.way/?ti=as');
                                    },
                                    icon: new Icon(
                                      FontAwesomeIcons.facebook,
                                      size: 20.0,
                                    )),
                              ),
                            ),
                          ),
                          new Container(
                              height: 45.0,
                              width: 45.0,
                              child: Center(
                                child: Card(
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        25.0), // half of height and width of Image
                                  ),
                                  child: IconButton(
                                      color: Color(0xFF162A49),
                                      onPressed: () {
                                        Utils.openLink(
                                            url: 'https://t.me/irtiqaaway');
                                      },
                                      icon: new Icon(
                                        FontAwesomeIcons.telegram,
                                        size: 20.0,
                                      )),
                                ),
                              )),
                          new Container(
                              height: 45.0,
                              width: 45.0,
                              child: Center(
                                child: Card(
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        25.0), // half of height and width of Image
                                  ),
                                  child: IconButton(
                                      color: Color(0xFF162A49),
                                      onPressed: () {
                                        Utils.openLink(
                                            url:
                                            'https://chat.whatsapp.com/FR9UkeUYRoH2oqhmKezayE');
                                      },
                                      icon: new Icon(
                                        FontAwesomeIcons.whatsapp,
                                        size: 20.0,
                                      )),
                                ),
                              )),
                          new Container(
                              height: 45.0,
                              width: 45.0,
                              child: Center(
                                child: Card(
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        25.0), // half of height and width of Image
                                  ),
                                  child: IconButton(
                                      color: Color(0xFF162A49),
                                      onPressed: () {
                                        Utils.openLink(
                                            url:
                                            'https://twitter.com/irtiqaaway?s=09');
                                      },
                                      icon: new Icon(
                                        FontAwesomeIcons.twitter,
                                        size: 20.0,
                                      )),
                                ),
                              )),
                          new Container(
                              height: 45.0,
                              width: 45.0,
                              child: Center(
                                child: Card(
                                  elevation: 5.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        25.0), // half of height and width of Image
                                  ),
                                  child: IconButton(
                                    icon: new Icon(
                                      FontAwesomeIcons.instagram,
                                      size: 20.0,
                                    ),
                                    color: Color(0xFF162A49),
                                    onPressed: () {
                                      Utils.openLink(
                                          url:
                                          'https://www.instagram.com/irtiqaawayradio/');
                                    },
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}