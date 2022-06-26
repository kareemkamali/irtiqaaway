import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:irtiqaawaybykareem/Responsive/SizeConfig.dart';
import 'package:irtiqaawaybykareem/Utils/Utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class BathMobashar extends StatefulWidget {
  const BathMobashar({Key? key}) : super(key: key);

  @override
  _BathMobasharState createState() => _BathMobasharState();
}

class _BathMobasharState extends State<BathMobashar> {
  openBrowserTab() async {
    await FlutterWebBrowser.openWebPage(url: "https://www.youtube.com/channel/UCA6spwnuQu6eb20QeBsJZWA/live");
    print('helo');
  }
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    openBrowserTab();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Center(child: Text('يمكنك متبعنا عبر منصات التواصل الاجتماعي كافة',)),
          Container(

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
        ],
      ),
    );
  }
}
