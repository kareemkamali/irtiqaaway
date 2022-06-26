import 'package:flutter/material.dart';
class FastNews{
  int id=0;
  String title="",time="",description="",link="";
  String image="";
  int cat1=0;
  int cat2=0;
  int cat3=0;


  FastNews(this.id, this.title, this.time, this.description, this.image,this.cat1,this.cat2,this.cat3);


  FastNews.fromJson(Map json){
    this.title=json["title"]["rendered"];

    this.cat1=json["categories"][0];


  }

}