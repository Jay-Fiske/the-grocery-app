import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'intro.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _visible1 = false;
  bool _visible2 = false;
  double height, width;
  Color font1, font2, font3, font4, font5, font6, font7;
  Color button1, button2, button3, button4, button5, button6, button7;

  void colorReset() {
    font1 = Colors.black;
    font2 = Colors.black;
    font3 = Colors.black;
    font4 = Colors.black;
    font5 = Colors.black;
    font6 = Colors.black;
    font7 = Colors.black;

    button1 = Colors.grey.shade300;
    button2 = Colors.grey.shade300;
    button3 = Colors.grey.shade300;
    button4 = Colors.grey.shade300;
    button5 = Colors.grey.shade300;
    button6 = Colors.grey.shade300;
    button7 = Colors.grey.shade300;
  }

  startTime() async {
    var duration = new Duration(seconds: 10);
    return new Timer(duration, route);
  }

  route() {
    _visible1 = false;
    _visible2 = true;
    setState(() {});
  }

  @override
  void initState() {
    _visible1 = true;
    startTime();
    colorReset();
    font1 = Colors.white;
    button1 = Colors.green;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: height,
            width: width,
            child: Image.asset(
              'assets/images/splash.jpg',
              fit: BoxFit.cover,
              color: Color(0xffffffff).withOpacity(0.2),
              colorBlendMode: BlendMode.modulate,
            ),
          ),
          Visibility(
            visible: _visible1,
            child: Center(
              child: Image.asset("assets/images/logo2.png"),
            ),
          ),
          Positioned(
            top: height * 0.1,
            left: width * 0.02,
            right: width * 0.02,
            child: Visibility(
              visible: _visible2,
              child: Container(
                child: AutoSizeText(
                  'Choose Your Preferred Language:',
                  style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 3,
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.25,
            left: width * 0.05,
            right: width * 0.05,
            child: Visibility(
              visible: _visible2,
              child: Container(
                padding: EdgeInsets.all(10),
                height: height * 0.5,
                width: width * 0.85,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlatButton(
                            onPressed: () {
                              colorReset();
                              font1 = Colors.white;
                              button1 = Colors.green;
                              setState(() {});
                            },
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 5.0),
                            height: 45,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: AutoSizeText(
                              'English',
                              style: TextStyle(
                                  color: font1,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            color: button1,
                          ),
                          FlatButton(
                            onPressed: () {
                              colorReset();
                              font2 = Colors.white;
                              button2 = Colors.green;
                              setState(() {});
                            },
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 8.0),
                            height: 45,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: AutoSizeText(
                              'हिंदी',
                              style: TextStyle(
                                  color: font2,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            color: button2,
                          )
                        ]),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlatButton(
                            onPressed: () {
                              colorReset();
                              font3 = Colors.white;
                              button3 = Colors.green;
                              setState(() {});
                            },
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 5.0),
                            height: 45,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: AutoSizeText(
                              'ગુજરાતી',
                              style: TextStyle(
                                  color: font3,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            color: button3,
                          ),
                          FlatButton(
                            onPressed: () {
                              colorReset();
                              font4 = Colors.white;
                              button4 = Colors.green;
                              setState(() {});
                            },
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 5.0),
                            height: 45,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: AutoSizeText(
                              'मराठी',
                              style: TextStyle(color: font4, fontSize: 20),
                            ),
                            color: button4,
                          )
                        ]),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FlatButton(
                          onPressed: () {
                            colorReset();
                            font5 = Colors.white;
                            button5 = Colors.green;
                            setState(() {});
                          },
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 5.0),
                          height: 45,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: AutoSizeText(
                            'தமிழ்',
                            style: TextStyle(
                                color: font5,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          color: button5,
                        ),
                        FlatButton(
                          onPressed: () {
                            colorReset();
                            font6 = Colors.white;
                            button6 = Colors.green;
                            setState(() {});
                          },
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 5.0),
                          height: 45,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: AutoSizeText(
                            'తెలుగు',
                            style: TextStyle(
                                color: font6,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          color: button6,
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlatButton(
                            onPressed: () {
                              colorReset();
                              font7 = Colors.white;
                              button7 = Colors.green;
                              setState(() {});
                            },
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 5.0),
                            height: 45,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: AutoSizeText(
                              'Others',
                              style: TextStyle(
                                  color: font7,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            color: button7,
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: height * 0.78,
              right: width * 0.05,
              child: Visibility(
                visible: _visible2,
                child: RaisedButton(
                  padding: EdgeInsets.all(18),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IntroScreen(),
                        ));
                  },
                  shape: CircleBorder(),
                  color: Colors.green,
                  child: Image.asset('assets/images/ArrowUp3.png',width: width*0.06,height:width*0.06),
              ),
              ))
        ],
      ),
    );
  }
}
