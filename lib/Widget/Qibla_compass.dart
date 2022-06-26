import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';
import 'package:irtiqaawaybykareem/Responsive/SizeConfig.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Loading_indicator.dart';
import 'LocationError.dart';

class QiblahCompass extends StatefulWidget {
  @override
  _QiblahCompassState createState() => _QiblahCompassState();
}

class _QiblahCompassState extends State<QiblahCompass> {
  final _locationStreamController =
  StreamController<LocationStatus>.broadcast();

  get stream => _locationStreamController.stream;

  @override
  void initState() {
    _checkLocationStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // padding: const EdgeInsets.all(8.0),
      child: StreamBuilder(
        stream: stream,
        builder: (context, AsyncSnapshot<LocationStatus> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return LoadingIndicator();
          if (snapshot.data!.enabled == true) {
            switch (snapshot.data!.status) {
              case LocationPermission.always:
              case LocationPermission.whileInUse:
                return QiblahCompassWidget();

              case LocationPermission.denied:
                return LocationErrorWidget(
                  error: "Location service permission denied",
                  callback: _checkLocationStatus,
                );
              case LocationPermission.deniedForever:
                return LocationErrorWidget(
                  error: "Location service Denied Forever !",
                  callback: _checkLocationStatus,
                );

              default:
                return Container();
            }
          } else {
            return LocationErrorWidget(
              error: "Please enable Location service",
              callback: _checkLocationStatus,
            );
          }
        },
      ),
    );
  }

  Future<void> _checkLocationStatus() async {
    final locationStatus = await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled &&
        locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final s = await FlutterQiblah.checkLocationStatus();
      _locationStreamController.sink.add(s);
    } else
      _locationStreamController.sink.add(locationStatus);
  }

  @override
  void dispose() {
    super.dispose();
    _locationStreamController.close();
    FlutterQiblah().dispose();
  }
}

class QiblahCompassWidget extends StatefulWidget {
  @override
  _QiblahCompassWidgetState createState() => _QiblahCompassWidgetState();
}

class _QiblahCompassWidgetState extends State<QiblahCompassWidget> {





   bool kaaba=true;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return LoadingIndicator();

        final qiblahDirection = snapshot.data;
        //aam jareb assem lachuf degreeeeeeeee

        var q=qiblahDirection!.qiblah * (pi / 180) * -1;


        if(double.parse(q.toStringAsFixed(2))<-6.22&&double.parse(q.toStringAsFixed(2))>-6.30){
          kaaba=false;
        }
        else if(double.parse(q.toStringAsFixed(2)) <0){
          kaaba=true;
          print(double.parse(q.toStringAsFixed(2)));
        }

        final _compassSvg = SvgPicture.asset('assets/images/qibla.svg',);

        final _needleSvg = SvgPicture.asset(
          'assets/images/qiblacompass.svg',
          color: kaaba?Colors.black:Colors.green,
          fit: BoxFit.contain,
          height: 60*SizeConfig.imageSizeMultiplier,
          alignment: Alignment.center,

        );



        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Transform.rotate(
              angle: (qiblahDirection.direction * (pi / 180) * -1),

              child: _compassSvg,
            ),

            Transform.rotate(
              angle: q,

              alignment: Alignment.center,
              child: _needleSvg,
            ),
            Positioned(
              bottom:5*SizeConfig.heightMultiplier,
              child:
              Text("${q.toStringAsFixed(2)}°"),
            ),




          ],
        );
      },
    );
  }
}
