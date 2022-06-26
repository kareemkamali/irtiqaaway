import 'dart:async';
import 'dart:convert';


import 'package:flutter/material.dart';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:hijri_picker/hijri_picker.dart';
import 'package:http/http.dart' as http;

import 'package:irtiqaawaybykareem/Module/DataTime.dart';
import 'package:irtiqaawaybykareem/Responsive/SizeConfig.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:weather_icons/weather_icons.dart';

import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {

  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {

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
  void initState() {
    super.initState();
run();
  }



  CalendarFormat format=CalendarFormat.month;
  DateTime selectedDay=DateTime.now();
  DateTime focusDay=DateTime.now();
  bool isswitch=true;
   late int lastMonth;
    late int lastYear;
      late int lastDay;
  var selectedDate = new HijriCalendar.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:SingleChildScrollView(
        child: Column(
          children: [
            isswitch==false?Card(
              //margin: const EdgeInsets.fromLTRB(50, 200, 50, 200),
              child: SfHijriDateRangePicker(
                view: HijriDatePickerView.month,
                selectionMode: DateRangePickerSelectionMode.multiple,
                selectionShape: DateRangePickerSelectionShape.rectangle,
                showNavigationArrow: true,
                selectionColor: Colors.blue,
                monthViewSettings: HijriDatePickerMonthViewSettings(
                    dayFormat: 'EEE',
                    viewHeaderStyle: DateRangePickerViewHeaderStyle(
                        backgroundColor: Colors.tealAccent)),
                headerStyle:
                DateRangePickerHeaderStyle(backgroundColor: Colors.blue),
              ),
            ):TableCalendar(

              focusedDay: focusDay,
              firstDay: DateTime(2021),
              lastDay: DateTime(2023),
              calendarFormat: format,
              onFormatChanged: (CalendarFormat _format){
                setState((){
                  format=_format;
                });

              },
              startingDayOfWeek: StartingDayOfWeek.sunday,
              daysOfWeekVisible: true,
              onDaySelected:(DateTime selectDay,DateTime focusDay){
                setState(() {
                  selectedDay=selectDay;
                  focusDay=focusDay;
                  lastDay=focusDay.day ;
                  lastMonth=focusDay.month ;
                  lastYear=focusDay.year ;

                });
              } ,


              selectedDayPredicate: (DateTime date){
                return isSameDay(selectedDay,date);
              },




              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,

                ),
                selectedTextStyle: TextStyle(
                    color: Colors.white
                )

                ,todayDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                // borderRadius: BorderRadius.circular(5),
                color: Colors.purpleAccent,

              ),


              ),

              headerStyle: HeaderStyle(formatButtonVisible: false,titleCentered: true,formatButtonShowsNext: false,formatButtonDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5.0),
              ),
                formatButtonTextStyle: TextStyle(color: Colors.white),
                leftChevronVisible: true,
                rightChevronVisible: true,
                // headerPadding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 10.0)
              ),


            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("تقويم الهجري"),
                Switch(value: isswitch, onChanged:(value) {
                  setState(() {
                    isswitch = value;
                    print(isswitch);
                  });
                },),
                Text("تقويم الميلادي"),

              ],
            ),





























            FutureBuilder(
              future: getPTData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: SizedBox(


                        child: const CircularProgressIndicator(
                            backgroundColor: Colors.black,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue))),
                  );
                } else if (snapshot.hasError)
                  return Center(
                    child: SizedBox(

                        child: const CircularProgressIndicator(
                            backgroundColor: Colors.black,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.red))),
                  );
                else if (snapshot.hasData) {
                  var container = Container(
                    //color: Colors.white,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/PASA2.png'),
                          fit: BoxFit.cover,
                        )),
                    height: (MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top),
                    child: SingleChildScrollView(
                        child: Column(children: <Widget>[
                          SizedBox(

                          ),
                          Center(
                            child: Text('${street},${city}, ${Address}',
                                style: TextStyle(
                                  color: Color.fromRGBO(23, 121, 194, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                          ),
                          SizedBox(
                            //   height: 5,
                          ),
                          Center(
                            child: Text('مواقيت الصلاة حسب توقيت إسنا (ISNA)',
                              style: TextStyle(
                                color: Color.fromRGBO(23, 121, 194, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          // Center(
                          //   child: Text(
                          //       '${list.data.date.hijri.weekday.ar} ${list.data.date.hijri.day} ${list.data.date.hijri.month.ar} ${list.data.date.hijri.year}',
                          //       style: TextStyle(
                          //         color: Color.fromRGBO(23, 121, 194, 1),
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 20,
                          //       )),
                          // ),
                          SizedBox(
                            height: 5,
                          ),
                          // Center(
                          //   child: Text('${list.data.date.readable}',
                          //       style: TextStyle(
                          //         color: Colors.grey,
                          //         fontWeight: FontWeight.w600,
                          //         fontSize: 17,
                          //       )),
                          // ),
                          Divider(
                            color: Color.fromRGBO(23, 121, 194, 1),
                          ),
                          Container(
                            // alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(
                                  top: 10, right: 20, left: 20, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Text(
                                    '${snapshot.data.data.timings.fajr}',
                                    maxLines: 1,
                                    //  textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(23, 121, 194, 1),
                                        fontSize: 17),
                                  ),
                                  Text(
                                    'الفجر',
                                    style: TextStyle(
                                //      fontFamily: ArabicFonts.Cairo,
                                      package: 'google_fonts_arabic',
                                      fontSize: 17,
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
                            // alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(
                                  top: 10, right: 20, left: 20, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${(snapshot.data.data.timings.dhuhr)}',
                                    maxLines: 1,
                                    //  textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(23, 121, 194, 1),
                                        fontSize: 17),
                                  ),
                                  Text(
                                    'الضهر',
                                    style: TextStyle(
                                   //   fontFamily: ArabicFonts.Cairo,
                                      package: 'google_fonts_arabic',
                                      fontSize: 17,
                                      color: Color.fromRGBO(23, 121, 194, 1),
                                    ),
                                  ),
                                  Icon(
                                    WeatherIcons.day_sunny,
                                    color: Color.fromRGBO(23, 121, 194, 1),
                                  ),
                                ],
                              )),
                          Container(
                            // alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(
                                  top: 10, right: 20, left: 20, bottom: 10),
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
                                   //   fontFamily: ArabicFonts.Cairo,
                                      package: 'google_fonts_arabic',
                                      fontSize: 17,
                                      color: Color.fromRGBO(23, 121, 194, 1),
                                    ),
                                  ),
                                  Icon(
                                    WeatherIcons.day_sunny_overcast,
                                    color: Color.fromRGBO(23, 121, 194, 1),
                                  ),
                                ],
                              )),
                          Container(
                            // alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(
                                  top: 10, right: 20, left: 20, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${(snapshot.data.data.timings.maghrib)}',
                                    maxLines: 1,
                                    //  textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(23, 121, 194, 1),
                                        fontSize: 17),
                                  ),
                                  Text(
                                    'المغرب',
                                    style: TextStyle(
                                    //  fontFamily: ArabicFonts.Cairo,
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
                          Container(
                            // alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(
                                  top: 10, right: 20, left: 20, bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${(snapshot.data.data.timings.isha)}',
                                    maxLines: 1,
                                    //  textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(23, 121, 194, 1),
                                        fontSize: 17),
                                  ),
                                  Text(
                                    'العشاء',
                                    style: TextStyle(
                                   //   fontFamily: ArabicFonts.Cairo,
                                      package: 'google_fonts_arabic',
                                      fontSize: 17,
                                      color: Color.fromRGBO(23, 121, 194, 1),
                                    ),
                                  ),
                                  Icon(
                                    WeatherIcons.night_cloudy,
                                    color: Color.fromRGBO(23, 121, 194, 1),
                                  ),
                                ],
                              )),
                          Opacity(opacity: 0.2,child:   Padding(
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
                  return SingleChildScrollView(
                    child: container,
                  );
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
                  /*Center(
                child:
                SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: const CircularProgressIndicator(
                        backgroundColor: Colors.black,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue))),

              );
              */
                }
              },
              //for th else
            ),
          ],
        ),
      ) ,
      floatingActionButton: new FloatingActionButton(
        onPressed: () => _selectDate(context),
        tooltip: 'Pick Date',
        child: new Icon(Icons.event),
      ),
    );
  }






  Future<Null> _selectDate(BuildContext context) async {
    final HijriCalendar? picked = await showHijriDatePicker(
      context: context,
      initialDate: selectedDate,

      lastDate: new HijriCalendar()
        ..hYear = 1445
        ..hMonth = 9
        ..hDay = 25,
      firstDate: new HijriCalendar()
        ..hYear = 1438
        ..hMonth = 12
        ..hDay = 25,
      initialDatePickerMode: DatePickerMode.day,
    );
    if (picked != null)
      setState(() {
        selectedDate = picked;
      });
  }





}



