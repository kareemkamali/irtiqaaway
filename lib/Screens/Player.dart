import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:irtiqaawaybykareem/Responsive/SizeConfig.dart';

class Players extends StatefulWidget {
  const Players({Key? key}) : super(key: key);

  @override
  _PlayersState createState() => _PlayersState();
}

class _PlayersState extends State<Players> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool _isIrPause = true;
  bool _isQrPause = true;
  bool _isHdPause = true;

  @override
  void initState() {
    setState(() {
      audioPlayer.pause();

    });
  }


  @override
  void dispose() {
    audioPlayer.pause();

  }

  initAudioir() {
    setState(() {
      _isQrPause = true;
      _isHdPause = true;
      _isIrPause = !_isIrPause;
    });
    if (_isIrPause) {
      audioPlayer.pause();
    } else {
      audioPlayer.play("https://s5.radio.co/s9c4b00fa5/listen");
    }
  }

  // pauseAudioir() {
  //   audioPlayer.pause();
  // }

  initAudioqr() {
    setState(() {
      _isQrPause = !_isQrPause;
      _isHdPause = true;
      _isIrPause = true;
    });
    if (_isQrPause) {
      audioPlayer.pause();
    } else {
      audioPlayer.play("https://s5.radio.co/sb31373ca4/listen");
    }
  }

  // pauseAudioqr() {
  //   audioPlayer.pause();
  // }

  initAudiohd() {
    setState(() {
      _isQrPause = true;
      _isHdPause = !_isHdPause;
      _isIrPause = true;
    });
    if (_isHdPause) {
      audioPlayer.pause();
    } else {
      audioPlayer.play("https://s5.radio.co/scfafe52c4/listen");
    }
  }

  // pauseAudiohd() {
  //   audioPlayer.pause();
  // }

  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery .of(context) .size;
    final double categoryHeight = size.height * 0.30;
    return SafeArea(
      bottom: false,
      left: false,
      right: false,
      top: false,
      child: LayoutBuilder(
        builder: (context,constraints){

          return OrientationBuilder(builder: (context,orientation)
          {
            SizeConfig().init(constraints, orientation);
            return  Scaffold(


              body: Container(
                height: 100*SizeConfig.heightMultiplier,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/background10.jpg'),
                      fit: BoxFit.cover,
                    )),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Text(
                              "راديو طريق الارتقاء",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(23, 121, 194, 1),
                                fontFamily: "Arajozoor",
                                fontSize: 3*SizeConfig.textMultiplier,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(


                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 3 * SizeConfig.widthMultiplier,
                            vertical: 0,
                          ),
                          child: Text(
                            "يمكن الآن الاستماع الى اذاعة القرآن الكريم ، اذاعةالحديث الشريف و اذاعة طريق الارتقاء",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromRGBO(23, 121, 194, 1),
                              fontFamily: "Arajozoor",
                              fontSize: 3*SizeConfig.textMultiplier,
                            ),

                          ),
                        ),

                      ),

                      Container(
                        child: Text(
                          "اضغط على اي اذاعة للاستماع",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(23, 121, 194, 1),
                            fontFamily: "Arajozoor",
                            fontSize: 2*SizeConfig.textMultiplier,
                          ),
                        ),
                      ),


                      Padding(
                        padding:  EdgeInsets.only(top:2*SizeConfig.heightMultiplier),
                        child: Container(

                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 200),
                            opacity: closeTopContainer ? 0 : 1,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),

                              alignment: Alignment.topCenter,
                              // height: closeTopContainer ? 0 : categoryHeight,
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  // height:40*SizeConfig.heightMultiplier,
                                  // width: 100*SizeConfig.widthMultiplier,
                                  child: Row(
                                    children: <Widget>[
                                      // SizedBox(width: size.width*0.01,),
                                      InkWell(
                                        child: Container(
                                          width:30*SizeConfig.widthMultiplier,
                                          // padding: EdgeInsets.only(
                                          //   left: size.width*0.0,
                                          //   right: size.width*0.02,
                                          // ),
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(238, 238, 238, 1.0),
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(0.0)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: _isIrPause?Color.fromRGBO(
                                                    227, 227, 227, 1.0):Color.fromRGBO(40, 123, 175, 1.0),
                                                spreadRadius: 2,
                                                blurRadius: 3,
                                                offset: Offset(1, 4),
                                              ),
                                            ],
                                          ),
                                          child: LayoutBuilder(
                                            builder: (ctx, constraints) =>
                                                Padding(
                                                  padding:  EdgeInsets.only(top:1*SizeConfig.heightMultiplier,bottom:1*SizeConfig.heightMultiplier ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .center,
                                                    children: <Widget>[
                                                      Container(
                                                        height:20*SizeConfig.imageSizeMultiplier ,
                                                        width: 20*SizeConfig.imageSizeMultiplier,
                                                        child: CircleAvatar(
                                                          backgroundImage: AssetImage(
                                                              "assets/images/logo.jpeg"),
                                                          backgroundColor:
                                                          Color.fromRGBO(
                                                              238, 238, 238, 1.0),
                                                          foregroundColor:
                                                          Color.fromRGBO(
                                                              238, 238, 238, 1.0),
                                                        ),
                                                      ),
                                                      Container(
                                                        // height: constraints.maxWidth *1,
                                                        // width: constraints.maxHeight*1,
                                                        child: Text(
                                                          "اذاعة \طريق الارتقاء",
                                                          style: TextStyle(
                                                              fontSize:3*SizeConfig.textMultiplier,
                                                              color:
                                                              Color.fromRGBO(
                                                                  40, 123, 175, 1.0),
                                                              fontWeight: FontWeight
                                                                  .bold),
                                                        ),
                                                      ),

                                                      Center(
                                                        child: Container(
                                                          // height: constraints.maxWidth*0.3,
                                                          child: ElevatedButton(
                                                              child: new Icon(
                                                                _isIrPause
                                                                    ? Icons.play_arrow
                                                                    : Icons.pause,
                                                                size: 15*SizeConfig.imageSizeMultiplier,
                                                                color: Color.fromRGBO(
                                                                    255, 255, 255, 1.0),
                                                              ),
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                primary:_isIrPause? Color.fromRGBO(
                                                                    40, 123, 175, 1.0):Colors.blue[400],
                                                                shape: CircleBorder(),
                                                              ),
                                                              onPressed: () async {
                                                                initAudioir();
                                                              }),
                                                        ),
                                                      ),



                                                    ],
                                                  ),
                                                ),
                                          ),
                                        ),
                                        onTap: () async {
                                          initAudioir();
                                          _isIrPause
                                              ? Icons.play_arrow
                                              : Icons.pause;
                                        },),










                                      SizedBox(width:3*SizeConfig.widthMultiplier),
                                      InkWell(
                                        child: Container(
                                          width:30*SizeConfig.widthMultiplier,
                                          // padding: EdgeInsets.only(
                                          //   left: size.width*0.0,
                                          //   right: size.width*0.02,
                                          // ),
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(238, 238, 238, 1.0),
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(0.0)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: _isQrPause?Color.fromRGBO(
                                                    227, 227, 227, 1.0):Color.fromRGBO(40, 123, 175, 1.0),
                                                spreadRadius: 2,
                                                blurRadius: 3,
                                                offset: Offset(1, 4),
                                              ),
                                            ],
                                          ),
                                          child: LayoutBuilder(
                                            builder: (ctx, constraints) =>
                                                Padding(
                                                  padding:  EdgeInsets.only(top:1*SizeConfig.heightMultiplier,bottom:1*SizeConfig.heightMultiplier ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .center,
                                                    children: <Widget>[
                                                      Container(
                                                        height:20*SizeConfig.imageSizeMultiplier ,
                                                        width: 20*SizeConfig.imageSizeMultiplier,
                                                        child: CircleAvatar(
                                                          backgroundImage: AssetImage(
                                                              "assets/images/qrlogo.png"),
                                                          backgroundColor:
                                                          Color.fromRGBO(
                                                              238, 238, 238, 1.0),
                                                          foregroundColor:
                                                          Color.fromRGBO(
                                                              238, 238, 238, 1.0),
                                                        ),
                                                      ),
                                                      Container(
                                                        // height: constraints.maxWidth *1,
                                                        // width: constraints.maxHeight*1,
                                                        child: Text(
                                                          "الارتقاء \nللقرآن الكريم",
                                                          style: TextStyle(
                                                              fontSize:3*SizeConfig.textMultiplier,
                                                              color:
                                                              Color.fromRGBO(
                                                                  40, 123, 175, 1.0),
                                                              fontWeight: FontWeight
                                                                  .bold),
                                                        ),
                                                      ),

                                                      Center(
                                                        child: Container(
                                                          // height: constraints.maxWidth*0.3,
                                                          child: ElevatedButton(
                                                              child: new Icon(
                                                                _isQrPause
                                                                    ? Icons.play_arrow
                                                                    : Icons.pause,
                                                                size: 15*SizeConfig.imageSizeMultiplier,
                                                                color:
                                                                Color.fromRGBO(
                                                                    255, 255, 255, 1.0),
                                                              ),
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                primary: _isQrPause?Color.fromRGBO(
                                                                    40, 123, 175, 1.0):Colors.black87,
                                                                shape: CircleBorder(),
                                                              ),
                                                              onPressed: () async {
                                                                initAudioqr();
                                                              }),
                                                        ),
                                                      ),



                                                    ],
                                                  ),
                                                ),
                                          ),
                                        ),
                                        onTap: () async {
                                          initAudioqr();
                                          _isQrPause
                                              ? Icons.play_arrow
                                              : Icons.pause;
                                        },),
                                      SizedBox(width:3*SizeConfig.widthMultiplier),
                                      InkWell(
                                        child: Container(
                                          width:30*SizeConfig.widthMultiplier,
//                                          height:220,                                          // padding: EdgeInsets.only(
                                          //   left: size.width*0.0,
                                          //   right: size.width*0.02,
                                          // ),
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(238, 238, 238, 1.0),
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(0.0)),
                                            boxShadow: [
                                              BoxShadow(
                                                color:     _isHdPause?Color.fromRGBO(
                                                    227, 227, 227, 1.0):Color.fromRGBO(40, 123, 175, 1.0),
                                                spreadRadius: 2,
                                                blurRadius: 3,
                                                offset: Offset(1, 4),
                                              ),
                                            ],
                                          ),
                                          child: LayoutBuilder(
                                            builder: (ctx, constraints) =>
                                                Padding(
                                                  padding:  EdgeInsets.only(top:1*SizeConfig.heightMultiplier,bottom:1*SizeConfig.heightMultiplier ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .center,
                                                    children: <Widget>[
                                                      Container(
                                                        height:20*SizeConfig.imageSizeMultiplier ,
                                                        width: 20*SizeConfig.imageSizeMultiplier,
                                                        child: CircleAvatar(
                                                          backgroundImage: AssetImage(
                                                              "assets/images/had.png"),
                                                          backgroundColor:
                                                          Color.fromRGBO(
                                                              238, 238, 238, 1.0),
                                                          foregroundColor:
                                                          Color.fromRGBO(
                                                              238, 238, 238, 1.0),
                                                        ),
                                                      ),
                                                      Container(
                                                        // height: constraints.maxWidth *1,
                                                        // width: constraints.maxHeight*1,
                                                        child: Text(
                                                          "الارتقاء \nللحديث النبوي",
                                                          style: TextStyle(
                                                              fontSize:2.72*SizeConfig.textMultiplier,
                                                              color:
                                                              Color.fromRGBO(
                                                                  40, 123, 175, 1.0),
                                                              fontWeight: FontWeight
                                                                  .bold),
                                                        ),
                                                      ),

                                                      Center(
                                                        child: Container(
                                                          // height: constraints.maxWidth*0.3,
                                                          child: ElevatedButton(
                                                              child: new Icon(
                                                                _isHdPause
                                                                    ? Icons.play_arrow
                                                                    : Icons.pause,
                                                                size: 15*SizeConfig.imageSizeMultiplier,
                                                                color: Color.fromRGBO(
                                                                    255, 255, 255, 1.0),
                                                              ),
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                primary:_isHdPause? Color.fromRGBO(
                                                                    40, 123, 175, 1.0):Colors.green[400],
                                                                shape: CircleBorder(),
                                                              ),
                                                              onPressed: () async {
                                                                initAudiohd();
                                                              }),
                                                        ),
                                                      ),



                                                    ],
                                                  ),
                                                ),
                                          ),
                                        ),
                                        onTap: () async {
                                          initAudiohd();
                                          _isHdPause
                                              ? Icons.play_arrow
                                              : Icons.pause;
                                        },),

















                                    ],
                                  ),

                                ),

                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top:4*SizeConfig.heightMultiplier),
                        child: Container(
                          child: Text(
                            "الحوار مع الآخر; كل الآخر",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromRGBO(23, 121, 194, 1),
                              fontFamily: "Droidkufi",
                              fontSize: 3*SizeConfig.textMultiplier,
                            ),
                          ),
                        ),
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
              ),
            );
          }
          );
        },

      ),
    );
  }

}