import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'components.dart';

class Notification2 extends StatefulWidget {
  @override
  _Notification2State createState() => _Notification2State();
}

class _Notification2State extends State<Notification2> {
  double width, height;
  @override
  void initState() {
    super.initState();
    reset();
  }
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.165),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Stack(children: [
            Container(),
            ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(width * 0.125),
                    bottomLeft: Radius.circular(width * 0.125)),
                child: Container(color: Colors.green, height: height * 0.15)),
            Positioned(
              top: height * 0.05,
              left: width * 0.3,
              right: width * 0.3,
              child: Container(
                alignment: Alignment.center,
                child: AutoSizeText(
                  'Notification',
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.0625,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Positioned(
              top: height * 0.1125,
              right: width * 0.3,
              left: width * 0.3,
              child: Container(
                width: width * 0.75,
                height: height * 0.075,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(width * 0.05),
                ),
                child: Material(
                    elevation: width * 0.0125,
                    borderRadius: BorderRadius.circular(width * 0.05),
                    child: Center(
                        child: Text(
                          'General',
                          style: TextStyle(
                              fontSize: width * 0.05,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w600),
                        ))),
              ),
            ),
          ]),
        ),
      ),
      body: Center(
        child: Container(
            child:Column(
                children:[
                  SizedBox(height: height*0.1,),
                  Image.asset('assets/images/image 45.png',width:width*0.65),
                  Padding(
                    padding:EdgeInsets.symmetric(vertical: height*0.02),
                    child: Text('No Notification Found',style: TextStyle(fontSize: width*0.075,color: Colors.grey.shade600,fontWeight: FontWeight.w600),),
                  ),
                  Text('You don\'t have any existing message',style: TextStyle(fontSize: width*0.05,color: Colors.grey.shade600,fontWeight: FontWeight.w400),)
                ]
            )
        ),
      ),
      floatingActionButton: fAB(width),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Bottom(),
    );
  }
}
