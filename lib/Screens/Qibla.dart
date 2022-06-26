import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:irtiqaawaybykareem/Responsive/Responsive_widget.dart';
import 'package:irtiqaawaybykareem/Responsive/SizeConfig.dart';
import 'package:irtiqaawaybykareem/Utils/Utils.dart';
import 'package:irtiqaawaybykareem/Widget/Loading_indicator.dart';
import 'package:irtiqaawaybykareem/Widget/Qibla_compass.dart';





class QiblahScreen extends StatefulWidget {
  static const routeName = '/QiblahScreen';
  @override
  _QiblahScreenState createState() => _QiblahScreenState();
}

class _QiblahScreenState extends State<QiblahScreen>
    with AutomaticKeepAliveClientMixin {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      right: false,
      left: false,
      child: LayoutBuilder(
        builder: (context,constraints){
          return OrientationBuilder(builder: (context,orientation){
            return MaterialApp(
              debugShowCheckedModeBanner: false,

              home: Scaffold(
                body: FutureBuilder(
                  future: _deviceSupport,
                  builder: (BuildContext context, AsyncSnapshot<bool?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting)
                      return LoadingIndicator();
                    if (snapshot.hasError)
                      return Center(
                        child: Text("Error: ${snapshot.error.toString()}"),
                      );

                    if (snapshot.hasData)
                      return Stack(
                        children: [
                          ResponsiveWidget(portraitLayout:PortraitLayout() ,
                            landscapeLayout:LandScapeLayout() ,)
                        ],
                      );
                    else
                      return Container(
                        width:MediaQuery.of(context).size.width,

                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/background10.jpg'),
                              fit: BoxFit.cover,
                            )),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("تحتاج مستشعر الجيروسكوب ",style: TextStyle(
                              fontSize: 5*SizeConfig.textMultiplier,
                              color: Color.fromRGBO(23, 121, 194, 1),
                              fontWeight: FontWeight.bold,
                              fontFamily: "Arajozoor",
                            ),),
                            Padding(
                              padding:  EdgeInsets.only(top:10*SizeConfig.heightMultiplier),
                              child: Text("جهازك لا يحتوي على مستشعر الجيروسكوب ",style: TextStyle(
                                fontSize: 3*SizeConfig.textMultiplier,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Arajozoor",

                              ),textAlign: TextAlign.center,),
                            ),
                            Text("يمكنك معرفه اتجاه القبله عن طريق جوجل عبر الضغط على الزر اسفل",
                              style: TextStyle(
                                fontSize: 3*SizeConfig.textMultiplier,
                                fontFamily: "Arajozoor",
                              ),textAlign: TextAlign.center,),
                            ElevatedButton(onPressed: (){
                              Utils.openLink(
                                  url:
                                  'https://qiblafinder.withgoogle.com/intl/en/desktop/finder/(view:context)');
                            },
                                child: Text("اضغط لمشاهدة الاتجاه")),
                            Container(
                              height: 40*SizeConfig.heightMultiplier,
                              width: 95*SizeConfig.widthMultiplier,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/findqibla.PNG'),
                                    fit: BoxFit.fill,
                                  )),
                            )
                          ],
                        ),
                      );
                  },
                ),
              ),
            );

          });

        },

      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
class PortraitLayout extends StatefulWidget {

  @override
  _PortraitLayoutState createState() => _PortraitLayoutState();
}

class _PortraitLayoutState extends State<PortraitLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background10.jpg'),
            fit: BoxFit.cover,
          )),
      child: Column(

        children: [

          Container(

            // height:13*SizeConfig.heightMultiplier,
            margin: EdgeInsets.only(top: 6*SizeConfig.heightMultiplier),
            child: Text("ِ﴾فَوَلِّ وَجْهَكَ شَطْرَ الْمَسْجِدِ الْحَرَام﴿",
              style: TextStyle(
                  fontSize: 3*SizeConfig.textMultiplier,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(207, 160, 21 ,1)
              ),),
          ),



          Container(

              height: 40*SizeConfig.heightMultiplier,
              child: QiblahCompass()),
          Container(
            height:20*SizeConfig.heightMultiplier,
            child: Center(

              child: Text("اتجاه القبلة يعتمد على الموقع الجغرافي للجهاز\n,"
                  "تشغيل تحديد الموقع يساهم في تحسين تحديد موقعك."
                ,style:
                TextStyle(

                    fontSize: 1.5*SizeConfig.textMultiplier,
                    color: Color.fromRGBO(130, 130, 123, 1)
                ),textAlign: TextAlign.right,),
            ),
          ),
          Opacity(opacity: 0.3,child:   Padding(
            padding:  EdgeInsets.only(top:2*SizeConfig.widthMultiplier),
            child: Container(

              child: Image.asset("assets/images/posts/Logo.png",width:25*SizeConfig.imageSizeMultiplier,),
            ),
          ),

          )

        ],
      ),
    );
  }
}
class LandScapeLayout extends StatefulWidget {

  @override
  _LandScapeLayoutState createState() => _LandScapeLayoutState();
}

class _LandScapeLayoutState extends State<LandScapeLayout> {
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [

        Container(
          height:4*SizeConfig.heightMultiplier,

          child: Text("ِ﴾فَوَلِّ وَجْهَكَ شَطْرَ الْمَسْجِدِ الْحَرَام﴿",
            style: TextStyle(
                fontSize: 2*SizeConfig.textMultiplier,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(207, 160, 21 ,1)
            ),),
        ),



        Container(

            height: 20*SizeConfig.heightMultiplier,
            child: QiblahCompass()),
        Container(
          height:10*SizeConfig.heightMultiplier,
          child: Center(

            child: Text("اتجاه القبلة يعتمد على الموقع الجغرافي للجهاز\n,"
                "تشغيل تحديد الموقع يساهم في تحسين تحديد موقعك."
              ,style:
              TextStyle(

                  fontSize: 1.5*SizeConfig.textMultiplier,
                  color: Color.fromRGBO(130, 130, 123, 1)
              ),textAlign: TextAlign.right,),
          ),
        ),


      ],
    );
  }
}

