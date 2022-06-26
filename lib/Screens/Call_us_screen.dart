
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:irtiqaawaybykareem/Responsive/Responsive_widget.dart';
import 'package:irtiqaawaybykareem/Responsive/SizeConfig.dart';
import 'package:irtiqaawaybykareem/Utils/Utils.dart';
import 'package:irtiqaawaybykareem/Widget/Roundet_button.dart';


class CallUsScreen extends StatefulWidget {
  @override
  _CallUsScreenState createState() => _CallUsScreenState();
}

class _CallUsScreenState extends State<CallUsScreen> {
  @override
  Widget build(BuildContext context) {
//    final mediaQeury = MediaQuery.of(context);


    return  SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [ResponsiveWidget(portraitLayout: PortaitcLayout(),
                landscapeLayout:LanscapecLayout()
            ),
            ],
          ),
        ],
      ),
    );
  }
}
class PortaitcLayout extends StatefulWidget {

  @override
  _PortaitcLayoutState createState() => _PortaitcLayoutState();
}

class _PortaitcLayoutState extends State<PortaitcLayout> {
  final address =
      'طرابلس' + '\n' + 'ساحة النور مجمع طرابلس' + '\n' + 'الطابق العاشر';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/gray-white-gradient.jpg'),
              //image: NetworkImage(
              //  'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg'),
              // image: AssetImage("assets/images/delete_01.gif"),
              fit: BoxFit.fill,
            )),
        //   height: (mediaQeury.size.height - mediaQeury.padding.top),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          //  crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ///////////////////////////////////////////////////
            //////////////////////////////////////////////
            Padding(
              padding:  EdgeInsets.only(top:1*SizeConfig.heightMultiplier),
              child: Container(

                //color: Colors.blue[50],
                child: ListTile(
                  title: Text(
                    address,
                    //'طرابلس',
                    overflow: TextOverflow.clip,
                    style: TextStyle(color:  Color.fromRGBO(23, 121, 194, 1), fontSize: 3*SizeConfig.textMultiplier),
                    textAlign: TextAlign.center,
                    textScaleFactor:0.12*SizeConfig.textMultiplier,


                  ),
                  //trailing: Icon(Icons.done),
                  //  subtitle: Text('This is subtitle'),
                  selected: true,
                  onTap: () {
                    Utils.openLink(
                        url: 'https://maps.app.goo.gl/KGE1pbuoTmUJVJQXA');

                  },

                ),

              ),
            ),
            RoundedButton(
              text: ("موقعنا"),
              press: (){
                Utils.openLink(
                    url: 'https://maps.app.goo.gl/KGE1pbuoTmUJVJQXA');
              },
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                //  margin: EdgeInsets.all(5),
                //width: mediaQeury.size.width * 0.9,
                // height: MediaQuery.of(context).devicePixelRatio * 12,
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color:Color.fromRGBO(23, 121, 194, 1),
                  ),
                  title: Text(
                    '009616629111',
                    textScaleFactor: 1.5,
                    style: TextStyle(color: Color.fromRGBO(23, 121, 194, 1), fontSize: 1.5*SizeConfig.textMultiplier),
                  ),
                  selected: true,
                  onTap: () {
                    Utils.openPhoneCall(phoneNumber: '+961 6 629111');
                    setState(() {
                      print('clicked');
                      // txt='List Tile pressed';
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: 2*SizeConfig.widthMultiplier,
                    horizontal:2*SizeConfig.widthMultiplier

                ),
                //  margin: EdgeInsets.symmetric(vertical: 0.05),
                // width: mediaQeury.size.width * 0.9,
                // height: MediaQuery.of(context).devicePixelRatio * 12,
                child: ListTile(
                  leading: Icon(
                    Icons.message,
                    color: Color.fromRGBO(23, 121, 194, 1),
                  ),
                  title: Text(
                    '009616629222',
                    style: TextStyle(color: Color.fromRGBO(23, 121, 194, 1), fontSize: 1.5*SizeConfig.textMultiplier),
                    textScaleFactor: 1.5,
                  ),
                  //trailing: Icon(Icons.done),
                  //  subtitle: Text('This is subtitle'),
                  selected: true,
                  onTap: () {
                    Utils.openPhoneCall(phoneNumber: '+961 6 629222');
                    setState(() {
                      print('clicked');
                      // txt='List Tile pressed';
                    });
                  },
                ),
              ),
            ),
            //   Divider(color: Colors.grey),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: 2*SizeConfig.widthMultiplier,
                    horizontal:2*SizeConfig.widthMultiplier

                ),
                //  margin: EdgeInsets.symmetric(vertical: 0.05),
                // width: mediaQeury.size.width * 0.9,
                //  height: MediaQuery.of(context).devicePixelRatio * 12,
                //   height:
                //  (mediaQeury.size.height - mediaQeury.padding.top) * 0.04,
                // color: Colors.blue[50],
                child: ListTile(
                  leading: Icon(
                    Icons.mobile_friendly,
                    color: Color.fromRGBO(23, 121, 194, 1),
                  ),
                  title: Text(
                    '0096171629111',
                    style: TextStyle(color:Color.fromRGBO(23, 121, 194, 1), fontSize: 1.5*SizeConfig.textMultiplier),
                    textScaleFactor: 1.5,
                  ),
                  //trailing: Icon(Icons.done),
                  //  subtitle: Text('This is subtitle'),
                  selected: true,
                  onTap: () {
                    Utils.openPhoneCall(phoneNumber: '+961 71 629111');
                    // callPhone('+961 71 629111');
                    setState(() {
                      print('clicked');
                      // txt='List Tile pressed';
                    });
                  },
                ),
              ),
            ),
            // Divider(color: Colors.grey),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: 2*SizeConfig.widthMultiplier,
                    horizontal:2*SizeConfig.widthMultiplier

                ),
                //  margin: EdgeInsets.symmetric(vertical: 0.05),
                // width: mediaQeury.size.width * 0.9,
                //  height: MediaQuery.of(context).devicePixelRatio * 12,

                //height:
                //   (mediaQeury.size.height - mediaQeury.padding.top) * 0.04,
                //  color: Colors.blue[50],
                child: ListTile(
                  leading: Icon(Icons.mail, color: Color.fromRGBO(23, 121, 194, 1)),
                  title: Text(
                    'info@irtiqaaway.com',
                    style: TextStyle(color: Color.fromRGBO(23, 121, 194, 1), fontSize: 1.5*SizeConfig.textMultiplier),
                    textScaleFactor: 1.5,
                  ),
                  //trailing: Icon(Icons.done),
                  //  subtitle: Text('This is subtitle'),
                  selected: true,
                  onTap: () {
                    Utils.openEmail(toEmail: 'info@irtiqaaway.com');
                    // launchUrl('info@irtiqaaway.com');
                    setState(() {
                      print('clicked');
                      // txt='List Tile pressed';
                    });
                  },
                ),
              ),
            ),
            //  Divider(color: Colors.grey),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: 2*SizeConfig.widthMultiplier,
                    horizontal:2*SizeConfig.widthMultiplier

                ),
                // width: mediaQeury.size.width * 0.9,
                height: MediaQuery.of(context).devicePixelRatio * 12,
                child: ListTile(
                  leading: Icon(Icons.web, color:Color.fromRGBO(23, 121, 194, 1)),
                  title: Text(
                    'www.irtiqaaway.com',
                    style: TextStyle(color: Color.fromRGBO(23, 121, 194, 1), fontSize: 1.5*SizeConfig.textMultiplier),
                    textScaleFactor: 1.5,
                  ),
                  selected: true,
                  onTap: () {
                    Utils.openLink(url: 'http://www.irtiqaaway.com/');
                    setState(() {
                      print('clicked');
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top:0.9*SizeConfig.heightMultiplier),
              child: Container(

                child: Column(

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.facebook,color: Colors.blue,),
                        TextButton(onPressed: (){ Utils.openLink(
                            url:
                            'https://www.facebook.com/irtiqaa.way/?ti=as');}, child: Text("فايسبوك",style: TextStyle(fontSize: 1.8*SizeConfig.textMultiplier))),

                        Icon(FontAwesomeIcons.whatsapp,color: Colors.green[400],),
                        TextButton(onPressed: (){Utils.openLink(
                            url:
                            'https://chat.whatsapp.com/FR9UkeUYRoH2oqhmKezayE');
                        }, child: Text("واتس اب",style: TextStyle(fontSize: 1.8*SizeConfig.textMultiplier))),
                      ],


                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Icon(FontAwesomeIcons.instagram,color: Colors.pink,),
                        TextButton(onPressed: (){ Utils.openLink(
                            url:
                            'https://www.instagram.com/irtiqaawayradio/');
                        }, child: Text("انستغرام",style: TextStyle(fontSize: 1.8*SizeConfig.textMultiplier),)),

                        Icon(FontAwesomeIcons.twitter,color: Colors.blue[400],),
                        TextButton(onPressed: (){ Utils.openLink(
                            url:
                            'https://twitter.com/irtiqaaway?s=09');}, child: Text("تويتر",style: TextStyle(fontSize: 1.8*SizeConfig.textMultiplier))),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Icon(FontAwesomeIcons.telegram,color: Colors.blue[600],),
                        TextButton(onPressed: (){ Utils.openLink(
                            url: 'https://t.me/irtiqaaway');}, child: Text("تليغرام",style: TextStyle(fontSize: 1.8*SizeConfig.textMultiplier)),),

                        Icon(FontAwesomeIcons.youtube,color: Colors.red,),
                        TextButton(onPressed: (){  Utils.openLink(
                            url:
                            'https://youtu.be/sM0qRTSJgWs');}, child: Text("يوتيوب",style: TextStyle(fontSize: 1.8*SizeConfig.textMultiplier))),
                      ],
                    )
                  ],
                ),
              ),
            ),

            RoundedButton(
              text: "Irtiqaa way Radio App v.3 2021",
              press: () {},
            ),
            Opacity(opacity: 0.3,child:   Padding(
              padding:  EdgeInsets.only(top:7*SizeConfig.widthMultiplier),
              child: Container(

                child: Image.asset("assets/images/posts/Logo.png",width:25*SizeConfig.imageSizeMultiplier,),
              ),
            ),

            )
          ],
        ),
      ),
    );
  }
}














class LanscapecLayout extends StatefulWidget {
  @override
  _LanscapecLayoutState createState() => _LanscapecLayoutState();
}

class _LanscapecLayoutState extends State<LanscapecLayout> {
  final address =
      'طرابلس' + '\n' + 'ساحة النور مجمع طرابلس' + '\n' + 'الطابق العاشر';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/gray-white-gradient.jpg'),
              //image: NetworkImage(
              //  'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg'),
              // image: AssetImage("assets/images/delete_01.gif"),
              fit: BoxFit.cover,
            )),
        //   height: (mediaQeury.size.height - mediaQeury.padding.top),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          //  crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ///////////////////////////////////////////////////
            //////////////////////////////////////////////
            Padding(
              padding:  EdgeInsets.only(top:1*SizeConfig.heightMultiplier),
              child: Container(

                //color: Colors.blue[50],
                child: ListTile(
                  title: Text(
                    address,
                    //'طرابلس',
                    overflow: TextOverflow.clip,
                    style: TextStyle(color:  Color.fromRGBO(23, 121, 194, 1), fontSize: 1.5*SizeConfig.textMultiplier),
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.5,


                  ),
                  //trailing: Icon(Icons.done),
                  //  subtitle: Text('This is subtitle'),
                  selected: true,
                  onTap: () {
                    Utils.openLink(
                        url: 'https://maps.app.goo.gl/KGE1pbuoTmUJVJQXA');

                  },

                ),

              ),
            ),

            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: 1*SizeConfig.widthMultiplier,
                    horizontal:2*SizeConfig.widthMultiplier

                ),
                //  margin: EdgeInsets.all(5),
                //width: mediaQeury.size.width * 0.9,
                // height: MediaQuery.of(context).devicePixelRatio * 11,
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color:Color.fromRGBO(23, 121, 194, 1),
                  ),
                  title: Text(
                    '009616629111',
                    textScaleFactor: 1.5,
                    style: TextStyle(color: Color.fromRGBO(23, 121, 194, 1), fontSize: 1.5*SizeConfig.textMultiplier),
                  ),
                  selected: true,
                  onTap: () {
                    Utils.openPhoneCall(phoneNumber: '+961 6 629111');

                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: 1*SizeConfig.widthMultiplier,
                    horizontal:2*SizeConfig.widthMultiplier

                ),
                //  margin: EdgeInsets.symmetric(vertical: 0.05),
                // width: mediaQeury.size.width * 0.9,
                // height: MediaQuery.of(context).devicePixelRatio * 10,
                child: ListTile(
                  leading: Icon(
                    Icons.message,
                    color: Color.fromRGBO(23, 121, 194, 1),
                  ),
                  title: Text(
                    '009616629222',
                    style: TextStyle(color: Color.fromRGBO(23, 121, 194, 1), fontSize: 1.5*SizeConfig.textMultiplier),
                    textScaleFactor: 1.5,
                  ),
                  //trailing: Icon(Icons.done),
                  //  subtitle: Text('This is subtitle'),
                  selected: true,
                  onTap: () {
                    Utils.openPhoneCall(phoneNumber: '+961 6 629222');

                  },
                ),
              ),
            ),
            //   Divider(color: Colors.grey),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: 1*SizeConfig.widthMultiplier,
                    horizontal:2*SizeConfig.widthMultiplier

                ),
                //  margin: EdgeInsets.symmetric(vertical: 0.05),
                // width: mediaQeury.size.width * 0.9,
                //height: MediaQuery.of(context).devicePixelRatio * 12,
                //   height:
                //  (mediaQeury.size.height - mediaQeury.padding.top) * 0.04,
                // color: Colors.blue[50],
                child: ListTile(
                  leading: Icon(
                    Icons.mobile_friendly,
                    color: Color.fromRGBO(23, 121, 194, 1),
                  ),
                  title: Text(
                    '0096171629111',
                    style: TextStyle(color:Color.fromRGBO(23, 121, 194, 1), fontSize: 1.5*SizeConfig.textMultiplier),
                    textScaleFactor: 1.5,
                  ),
                  //trailing: Icon(Icons.done),
                  //  subtitle: Text('This is subtitle'),
                  selected: true,
                  onTap: () {
                    Utils.openPhoneCall(phoneNumber: '+961 71 629111');

                  },
                ),
              ),
            ),
            // Divider(color: Colors.grey),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: 1.5*SizeConfig.widthMultiplier,
                    horizontal:2*SizeConfig.widthMultiplier

                ),
                //  margin: EdgeInsets.symmetric(vertical: 0.05),
                // width: mediaQeury.size.width * 0.9,
                //height: MediaQuery.of(context).devicePixelRatio * 11,

                //height:
                //   (mediaQeury.size.height - mediaQeury.padding.top) * 0.04,
                //  color: Colors.blue[50],
                child: ListTile(
                  leading: Icon(Icons.mail, color: Color.fromRGBO(23, 121, 194, 1)),
                  title: Text(
                    'info@irtiqaaway.com',
                    style: TextStyle(color: Color.fromRGBO(23, 121, 194, 1), fontSize: 1.5*SizeConfig.textMultiplier),
                    textScaleFactor: 1.5,
                  ),
                  //trailing: Icon(Icons.done),
                  //  subtitle: Text('This is subtitle'),
                  selected: true,
                  onTap: () {
                    Utils.openEmail(toEmail: 'info@irtiqaaway.com');
                    // launchUrl('info@irtiqaaway.com');

                  },
                ),
              ),
            ),
            //  Divider(color: Colors.grey),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: 0*SizeConfig.widthMultiplier,
                    horizontal:2*SizeConfig.widthMultiplier

                ),
                // width: mediaQeury.size.width * 0.9,
                //height: MediaQuery.of(context).devicePixelRatio * 11,
                child: ListTile(
                  leading: Icon(Icons.web, color:Color.fromRGBO(23, 121, 194, 1)),
                  title: Text(
                    'www.irtiqaaway.com',
                    style: TextStyle(color: Color.fromRGBO(23, 121, 194, 1), fontSize: 1.5*SizeConfig.textMultiplier),
                    textScaleFactor: 1.5,
                  ),
                  selected: true,
                  onTap: () {
                    Utils.openLink(url: 'http://www.irtiqaaway.com/');

                  },
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top:0.9*SizeConfig.heightMultiplier),
              child: Container(

                child: Column(

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.facebook,color: Colors.blue,),
                        TextButton(onPressed: (){ Utils.openLink(
                            url:
                            'https://www.facebook.com/irtiqaa.way/?ti=as');}, child: Text("فايسبوك",style: TextStyle(fontSize: 1.8*SizeConfig.textMultiplier))),

                        Icon(FontAwesomeIcons.whatsapp,color: Colors.green[400],),
                        TextButton(onPressed: (){Utils.openLink(
                            url:
                            'https://chat.whatsapp.com/FR9UkeUYRoH2oqhmKezayE');
                        }, child: Text("واتس اب",style: TextStyle(fontSize: 1.8*SizeConfig.textMultiplier))),
                      ],


                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Icon(FontAwesomeIcons.instagram,color: Colors.pink,),
                        TextButton(onPressed: (){ Utils.openLink(
                            url:
                            'https://www.instagram.com/irtiqaawayradio/');
                        }, child: Text("انستغرام",style: TextStyle(fontSize: 1.8*SizeConfig.textMultiplier),)),

                        Icon(FontAwesomeIcons.twitter,color: Colors.blue[400],),
                        TextButton(onPressed: (){ Utils.openLink(
                            url:
                            'https://twitter.com/irtiqaaway?s=09');}, child: Text("تويتر",style: TextStyle(fontSize: 1.8*SizeConfig.textMultiplier))),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Icon(FontAwesomeIcons.telegram,color: Colors.blue[600],),
                        TextButton(onPressed: (){ Utils.openLink(
                            url: 'https://t.me/irtiqaaway');}, child: Text("تليغرام",style: TextStyle(fontSize: 1.8*SizeConfig.textMultiplier)),),

                        Icon(FontAwesomeIcons.youtube,color: Colors.red,),
                        TextButton(onPressed: (){  Utils.openLink(
                            url:
                            'https://youtu.be/sM0qRTSJgWs');}, child: Text("يوتيوب",style: TextStyle(fontSize: 1.8*SizeConfig.textMultiplier))),
                      ],
                    )
                  ],
                ),
              ),
            ),

            RoundedButton(
              text: "Irtiqaa way Radio App v.3 2021",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}


