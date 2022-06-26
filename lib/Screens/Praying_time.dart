import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
 //

import 'package:geolocator/geolocator.dart';

import 'package:irtiqaawaybykareem/Module/DataTime.dart';
import 'package:irtiqaawaybykareem/Module/Json_Connection.dart';
import 'package:irtiqaawaybykareem/Responsive/SizeConfig.dart';
//import 'package:location/location.dart';
import 'package:weather_icons/weather_icons.dart';


class PrayingTimeScreen extends StatefulWidget {
  // static const routeName = '/prayingTimeScreen';

  PrayingTimeScreen({Key? key}) : super(key: key);

  @override
  _PrayingTimeScreenState createState() => _PrayingTimeScreenState();
}

class _PrayingTimeScreenState extends State<PrayingTimeScreen> {


  late Data list;
  String location ='Null, Press Button';
  String Address = '';
  String city = '';
  String street = '';
  static int method = 2;
  run()async{
     Position position = await _getGeoLocationPosition();
     location ='Lat: ${position.latitude} , Long: ${position.longitude}';
     GetAddressFromLatLong(position);
   }
  @override
  void initState() {
run();
  }

 //   String url =
 // 'http://api.aladhan.com/v1/timingsByCity?city=$city&country=$Address&method=$method';

   Future getPTData() async {
     var encodeFull = Uri.encodeFull('http://api.aladhan.com/v1/timingsByCity?city=$city&country=$Address&method=$method');
     var parse = Uri.parse(encodeFull);
     http.Response res = await http.get(parse, headers: {
       "Accept":
       "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
     });
     print(res.body);
     final data = jsonDecode(res.body);

     print('dataInScreen$data');
     list = Data.fromJson(data);
     // print('listtttttt${list.data.date.hijri.day}');
     return list;
   }






   Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
  Future<void> GetAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address = '${place.country}';
    city='${place.locality}';
    street='${place.street}';

    print('heloo');
    getPTData();
    //hone ha het method
    setState(()  {
    });
  }
  @override
  Widget build(BuildContext context) {
    var mediaQeury = MediaQuery.of(context);

    return Scaffold(
      body: FutureBuilder(

        future: getPTData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SizedBox(

                  child: const CircularProgressIndicator(
                      backgroundColor: Colors.black,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue))),
            );
          } else if (snapshot.hasError){
            print('here the error ${snapshot.hasError}');
            return Center(
              child: SizedBox(

                  child: const CircularProgressIndicator(
                      backgroundColor: Colors.black,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red))),
            );}
          else if (snapshot.hasData) {
            var container = Container(

              //color: Colors.white,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background10.jpg'),
                    fit: BoxFit.cover,
                  )),
              height: (mediaQeury.size.height - mediaQeury.padding.top),
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[

                    Padding(
                      padding:  EdgeInsets.only(top:4*SizeConfig.heightMultiplier),
                      child: Center(

                        child: Text('${city} ${Address}',
                            style: TextStyle(
                              color: Color.fromRGBO(23, 121, 194, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 2.5*SizeConfig.textMultiplier,
                            )),
                      ),
                    ),

                    Padding(
                      padding:  EdgeInsets.only(top:1.2*SizeConfig.heightMultiplier),
                      child: Center(
                        child: Text('مواقيت الصلاة حسب توقيت إسنا (ISNA)',
                          style: TextStyle(
                            color: Color.fromRGBO(23, 121, 194, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 1.6*SizeConfig.textMultiplier,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding:  EdgeInsets.only(top:0.5*SizeConfig.heightMultiplier),
                      child: Center(
                        child: Text(
                            '${list.data.date.hijri.weekday.ar} ${list.data.date.hijri.day} ${list.data.date.hijri.month.ar} ${list.data.date.hijri.year}',
                            style: TextStyle(
                              color: Color.fromRGBO(23, 121, 194, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 2.5*SizeConfig.textMultiplier,
                            )),
                      ),
                    ),

                    Padding(
                      padding:  EdgeInsets.only(top:0.9*SizeConfig.heightMultiplier),
                      child: Center(
                        child: Text('${list.data.date.readable}',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 2*SizeConfig.textMultiplier,
                            )),
                      ),
                    ),
                    Divider(
                      color: Color.fromRGBO(23, 121, 194, 1),
                    ),
                    Container(
                        color: Colors.white,
                        // alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(
                            top: 1*SizeConfig.heightMultiplier, right: 3*SizeConfig.widthMultiplier, left: 3*SizeConfig.widthMultiplier, bottom:2*SizeConfig.heightMultiplier),
                        child: Row(



                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Text(
                              '${snapshot.data.data.timings.fajr}',
                              maxLines: 1,
                              //  textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(23, 121, 194, 1),
                                  fontSize: 2*SizeConfig.textMultiplier),
                            ),

                            Text(
                              'الفجر',
                              style: TextStyle(
                             //   fontFamily: ArabicFonts.Cairo,
                                package: 'google_fonts_arabic',
                                fontSize: 2*SizeConfig.textMultiplier,
                                color: Color.fromRGBO(23, 121, 194, 1),
                              ),
                            ),
                            Icon(
                              WeatherIcons.sunrise,
                              color: Color.fromRGBO(23, 121, 194, 1),
                            ),
                          ],
                        )),





                    Container(
                        color: Colors.white,
                        // alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(
                            top: 1*SizeConfig.heightMultiplier, right: 3*SizeConfig.widthMultiplier, left: 3*SizeConfig.widthMultiplier, bottom:2*SizeConfig.heightMultiplier),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${(snapshot.data.data.timings.dhuhr)}',
                              maxLines: 1,
                              //  textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(23, 121, 194, 1),
                                  fontSize: 2*SizeConfig.textMultiplier),
                            ),
                            Text(
                              'الضهر',
                              style: TextStyle(
                             //   fontFamily: ArabicFonts.Cairo,
                                package: 'google_fonts_arabic',
                                fontSize: 2*SizeConfig.textMultiplier,
                                color: Color.fromRGBO(23, 121, 194, 1),
                              ),
                            ),
                            Icon(
                              WeatherIcons.day_sunny,
                              color: Color.fromRGBO(23, 121, 194, 1),
                            ),
                          ],
                        )),
                    Container( color: Colors.white,
                        // alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(
                            top: 1*SizeConfig.heightMultiplier, right: 3*SizeConfig.widthMultiplier, left: 3*SizeConfig.widthMultiplier, bottom:2*SizeConfig.heightMultiplier),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${(snapshot.data.data.timings.asr)}',
                              maxLines: 1,
                              //  textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(23, 121, 194, 1),
                                  fontSize: 17),
                            ),
                            Text(
                              'العصر',
                              style: TextStyle(
                           //    fontFamily: ArabicFonts.Cairo,
                                package: 'google_fonts_arabic',
                                fontSize: 2*SizeConfig.textMultiplier,
                                color: Color.fromRGBO(23, 121, 194, 1),
                              ),
                            ),
                            Icon(
                              WeatherIcons.day_sunny_overcast,
                              color: Color.fromRGBO(23, 121, 194, 1),
                            ),
                          ],
                        )),
                    Container( color: Colors.white,
                        // alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(
                            top: 1*SizeConfig.heightMultiplier, right: 3*SizeConfig.widthMultiplier, left: 3*SizeConfig.widthMultiplier, bottom:2*SizeConfig.heightMultiplier),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${(snapshot.data.data.timings.maghrib)}',
                              maxLines: 1,
                              //  textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(23, 121, 194, 1),
                                  fontSize: 2*SizeConfig.textMultiplier),
                            ),
                            Text(
                              'المغرب',
                              style: TextStyle(
                           //     fontFamily: ArabicFonts.Cairo,
                                package: 'google_fonts_arabic',
                                fontSize: 17,
                                color: Color.fromRGBO(23, 121, 194, 1),
                              ),
                            ),
                            Icon(
                              WeatherIcons.sunset,
                              color: Color.fromRGBO(23, 121, 194, 1),
                            ),
                          ],
                        )),
                    Container( color: Colors.white,
                      // alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(
                          top: 1*SizeConfig.heightMultiplier, right: 3*SizeConfig.widthMultiplier, left: 3*SizeConfig.widthMultiplier, bottom:2*SizeConfig.heightMultiplier),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${(snapshot.data.data.timings.isha)}',
                            maxLines: 1,
                            //  textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(23, 121, 194, 1),
                                fontSize: 2*SizeConfig.textMultiplier),
                          ),
                          Text(
                            'العشاء',
                            style: TextStyle(
                          //    fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                              fontSize: 2*SizeConfig.textMultiplier,
                              color: Color.fromRGBO(23, 121, 194, 1),
                            ),
                          ),
                          Icon(
                            WeatherIcons.night_cloudy,
                            color: Color.fromRGBO(23, 121, 194, 1),
                          ),
                        ],
                      ),


                    ),

                    Container(
                      color:Color.fromRGBO(40, 123, 175, 1),
                      width: MediaQuery.of(context).size.width*1,
                      child: Text("﴿إِنَّ الصَّلَاةَ كَانَتْ عَلَى الْمُؤْمِنِينَ كِتَابًا مَوْقُوتًاِ﴾",
                        style: TextStyle(
                            color: Color.fromRGBO(207, 160, 21 ,1),
                            fontWeight: FontWeight.bold,
                            fontSize:2.5*SizeConfig.textMultiplier
                        ),
                        textAlign:TextAlign.center,),
                    ),
                    Opacity(opacity: 0.5,child:   Padding(
                      padding:  EdgeInsets.only(top:7*SizeConfig.widthMultiplier),
                      child: Container(

                        child: Image.asset("assets/images/posts/Logo.png",width:25*SizeConfig.imageSizeMultiplier,),
                      ),
                    ),

                    )

                  ]
                    ///////////////////////////////////////////////////

                  )),
            );
            return container;
          } else {
            return Container(
              height: (MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top) *
                  0.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/gray-white-gradient.jpg'),
                    fit: BoxFit.fill,
                  )),
            );

          }
        },

      )
    );
  }

}
