import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'fourth.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: height / 6, bottom: height / 8),
            child: Image.asset(
              "assets/images/logo2.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 20),
            child: Text(
              'Welcome To ',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: width*0.05, right: width*0.05, bottom: height*0.025),
            child: AutoSizeText(
              'THE FAAMHOUSE.COM',maxLines: 1,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:  width*0.05),
            child: AutoSizeText(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin imperdiet elit. Proin imperdiet ',maxLines: 2,
              style: TextStyle(
                fontSize: 18,color:Colors.grey
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: height / 20),
              width: width * 0.8,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));

                },
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.symmetric(vertical: width*0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'GET STARTED',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      width: width / 10,
                    ),
                    Image.asset('assets/images/ArrowUp3.png',width: width*0.06,height:width*0.06),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    ));
  }
}
