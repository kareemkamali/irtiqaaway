import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';


import 'DataTime.dart';


class JsonConnection {
  static double pLat=0;
  static double pLong=0;

  late Data list;

  /* Future getPTLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);

    pLat = position.latitude;
    pLong = position.longitude;

    String date = DateTime.now().toIso8601String();
    int method = 4;

    final url =
        "http://api.aladhan.com/v1/timings/$date?latitude=$pLat&longitude=$pLong&method=$method";

    var encodeFull = Uri.encodeFull(url);
    var parse = Uri.parse(encodeFull);
    http.Response res = await http.get(parse, headers: {
      "Accept":*/
  //   "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
  //  });

  // http.Response res = await http.get(Uri.parse(url), headers: {
  //   "Accept":
  //"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
  // });

  // final data = json.decode(res.body);
  // print('data$data');

  /*   list = new Data.fromJson(data);
    print('batoul ${list.data}');

    return list;
  }*/
  Future getPTLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);

    pLat = position.latitude;
    pLong = position.longitude;

    String date = DateTime.now().toIso8601String();
    int method = 4;

    final url =
        "http://api.aladhan.com/v1/timings/$date?latitude=$pLat&longitude=$pLong&method=$method";
    var encodeFull = Uri.encodeFull(url);
    var parse = Uri.parse(encodeFull);

    http.Response res = await http.get(parse, headers: {
      "Accept":
      "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
    });

    final data = json.decode(res.body);

    list = new Data.fromJson(data);
    print('listttttt:${list.data.date.hijri.date}');
    return list;
  }
}
