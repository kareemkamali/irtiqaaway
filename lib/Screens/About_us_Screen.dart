
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:irtiqaawaybykareem/Responsive/SizeConfig.dart';

class AboutUsScreen extends StatelessWidget {
  final String ourViews = ".نحو إذاعة متخصصة وهادفة  " +
      '\n' +
      "تتخذ من الحوار وسيلة للقاء مع الاخر (كل الاخر) وفتح آفاق جديدة وصولاً لغايات كبيرة لطالما شكلت ولا تزال حلماً جميلاً آن الأوان لتحقيقه";
  final String ourValues =
      "هي طريق للارتقاء بالنفس البشرية الى العلو والسمو عن مغريات الدنيا وزينتها" +
          '\n' +
          ".نشر الوعي والتثقيف الجماهيري لكل اطياف مجتمعنا اللبناني والعربي " +
          '\n' +
          " .الرجوع الى النبع الصافي الكتاب والسنة للارتقاء بأفهامنا وتصويب مساراتنا";

  final String ourGoals =
      ".انشاء مؤسسة اعلامية رائدة على مستوى الوطن وخارجه من اجل المساهمة في ترسيخ مفاهيم الدعوة الى الله على منهاج الكتاب والسنة وبفهم سلف الامة, والسعي لتطوير هذه المؤسسة بحيث تواكب العصر وتمكن المجتمع من ارساء قواعد سليمة و متينة لحياة انسانية قوامها الحوار والتفاهم والكرامة والانسجام التام والعمل على تحقيق مفاهيم الارتقاء بالمجتمع نحو تطبيق الاسلام ومفاهيمه الاصيلة بعيدا عن البدع والخرافات والتشنجات العصبية التي رانت على قلوب المسلمين وابعدتهم عن منهل الاسلام الصافي ";
  final String ourMission =
      "فتح قنوات التواصل والحوار مع الاخر بكل مهنية واحترافية وشفافية قل نظيرها, من خلال كوادر اعلامية مؤهلة وباسلوب مميز كفيل ان شاء الله بتصحيح المفاهيم التقليدية الخاطئة";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("ar", "AR"),
      ],
      locale: Locale("ar", "AR"),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(

                image: DecorationImage(
                  image: AssetImage('assets/images/background10.jpg'),
                  fit: BoxFit.cover,
                ),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Column(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          //margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.4),
                          child: Text(
                            'رؤيتنا',

                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 4*SizeConfig.textMultiplier,
                                color: Color.fromRGBO(23, 121, 194, 1)),
                            //   textAlign: TextAlign.center,
                          )

                      ),
                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 4*SizeConfig.widthMultiplier,
                        vertical: 4*SizeConfig.heightMultiplier
                    ),
                    child: Container(
                      //color: Colors.black.withOpacity(0.5),

                        decoration: BoxDecoration(
                          // color: Colors.black.withOpacity(0.5),
                            color: Color.fromRGBO(23, 121, 194, 1)
                        ),
                        // margin: EdgeInsets.all(3),
                        //   padding: EdgeInsets.all(10),
                        //padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        padding: EdgeInsets.symmetric(horizontal: 1.5*SizeConfig.widthMultiplier, vertical: 1.5*SizeConfig.heightMultiplier),

                        height: 19*SizeConfig.heightMultiplier,
                        width: double.infinity,
                        child: SingleChildScrollView(
                            child: Container(
                              child: Text(
                                ourViews,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  //    fontFamily: ArabicFonts.Cairo,
                                  //  package: 'google_fonts_arabic',
                                  fontSize: 2*SizeConfig.textMultiplier,
                                  color: Color.fromRGBO(255, 255, 254, 1),
                                ),
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                            ))),
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        'رسالتنا',

                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 4*SizeConfig.textMultiplier,
                            color: Color.fromRGBO(23, 121, 194, 1)),
                      )),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 4*SizeConfig.widthMultiplier,
                        vertical: 4*SizeConfig.heightMultiplier),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(23, 121, 194, 1)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 1.5*SizeConfig.widthMultiplier, vertical: 1.5*SizeConfig.heightMultiplier),
                        height: 19*SizeConfig.heightMultiplier,
                        width: double.infinity,
                        child: SingleChildScrollView(
                            child: Center(
                                child: Text(
                                  ourMission,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 2*SizeConfig.textMultiplier,
                                      color: Color.fromRGBO(255, 255, 254, 1)),
                                )))),
                  ),

                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        'قيمتنا',
                        softWrap: true,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 4*SizeConfig.textMultiplier,
                            color: Color.fromRGBO(23, 121, 194, 1)),
                      )),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 4*SizeConfig.widthMultiplier,
                        vertical: 4*SizeConfig.heightMultiplier),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(23, 121, 194, 1)
                        ),
                        //  margin: EdgeInsets.all(3),
                        padding: EdgeInsets.symmetric(horizontal: 1.5*SizeConfig.widthMultiplier, vertical: 1.5*SizeConfig.heightMultiplier),

                        height: 20*SizeConfig.heightMultiplier,
                        child: SingleChildScrollView(
                            child: Center(
                                child: Text(
                                  ourValues,
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                  style: TextStyle(

                                    ///  fontFamily: ArabicFonts.Cairo,
                                    //  package: 'google_fonts_arabic',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 1.8*SizeConfig.textMultiplier,
                                      color: Color.fromRGBO(255, 255, 254, 1)),
                                )))),
                  ),

                  Container(
                    //     margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.4),
                      alignment: Alignment.center,
                      child: Text(
                        'أهدافنا',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 4*SizeConfig.textMultiplier,
                            color: Color.fromRGBO(23, 121, 194, 1)),
                      )),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 4*SizeConfig.widthMultiplier,
                        vertical: 4*SizeConfig.heightMultiplier),
                    child: Container(

                      decoration: BoxDecoration(
                          color: Color.fromRGBO(23, 121, 194, 1)

                      ),
                      padding: EdgeInsets.symmetric(horizontal: 1.5*SizeConfig.widthMultiplier, vertical: 1.5*SizeConfig.heightMultiplier),

                      height: 20*SizeConfig.heightMultiplier,
                      width: double.infinity,
                      child: SingleChildScrollView(

                        child: Center(
                          child: Text(
                            ourGoals,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 2*SizeConfig.textMultiplier,
                                color: Color.fromRGBO(255, 255, 254, 1)),
                          ),
                        ),

                      ),

                    ),
                  ),
                  Center(
                    child: Opacity(opacity: 0.5,child:   Padding(
                      padding:  EdgeInsets.only(top:7*SizeConfig.widthMultiplier),
                      child: Container(

                        child: Image.asset("assets/images/posts/Logo.png",width:25*SizeConfig.imageSizeMultiplier,),
                      ),
                    ),

                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
