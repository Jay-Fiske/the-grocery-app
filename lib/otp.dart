import 'package:flutter/material.dart';

import 'dashBoard.dart';


class Otp extends StatefulWidget {
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  double height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 25,
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Text('Surat,Gujarat', style: TextStyle(fontSize: 18))
                ],
              ),
              Container(
                margin:
                EdgeInsets.only(top: height * 0.05, bottom: height * 0.01),
                child: Text(
                  'OTP Authentication',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'An authentication code is sent to (+91)8934548912',
                style: TextStyle(
                    color: Colors.grey, fontSize: 20, wordSpacing: 1.0),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Text(
                'OTP',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Container(
                  width: width / 8,
                  child: TextField(
                    maxLength: 1,
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counterText: '',
                    ),
                  ),
                ),
                Container(
                  width: width / 8,
                  child: TextField(
                    maxLength: 1,
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counterText: '',
                    ),
                  ),
                ),
                Container(
                  width: width / 8,
                  child: TextField(
                    maxLength: 1,
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counterText: '',
                    ),
                  ),
                ),
                Container(
                  width: width / 8,
                  child: TextField(
                    maxLength: 1,
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counterText: '',

                    ),
                  ),
                ),
              ]),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: height / 20),
                  width: width * 0.8,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder:(context) => DashBoard(),));

                    },
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.symmetric(vertical: width*0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'CONTINUE',
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
              )
            ]),
          ),
        ),
      ),
    );
  }
}
