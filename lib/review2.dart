import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'components.dart';



class ReviewScreen2 extends StatefulWidget {
  @override
  _ReviewScreen2State createState() => _ReviewScreen2State();
}

class _ReviewScreen2State extends State<ReviewScreen2> {
  double height, width;
  @override
  void initState() {
    super.initState();
    reset();
  }
  bool reviewed = true;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.125),
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
              left: width * 0.15,
              right: width * 0.15,
              child: Container(
                alignment: Alignment.center,
                child: AutoSizeText(
                  'My Ratings and Reviews',
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Positioned(
              top: height * 0.11,
              right: width * 0.15,
              left: width * 0.15,
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
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                          curve: Curves.ease,
                          top: height * 0.005,
                          bottom: height * 0.005,
                          left: !reviewed ? width * 0.01 : width * 0.35,
                          right: !reviewed ? width * 0.35 : width * 0.01,
                          duration: Duration(milliseconds: 400),
                          child: Container(
                              height: height * 0.075,
                              width: width * 0.375,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(width * 0.05),
                                  color: Colors.grey.shade600))),
                      Positioned(
                        top: height * 0.0125,
                        bottom: height * 0.0125,
                        left: width * 0.005,
                        right: width * 0.005,
                        child: Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      reviewed = false;
                                      setState(() {});
                                    },
                                    child: Container(
                                      width: width * 0.3,
                                      height: height * 0.05,
                                      color: Colors.transparent,
                                      alignment: Alignment.center,
                                      child: AutoSizeText('To be reviewed',
                                          maxLines: 1,
                                          style: TextStyle(
                                              color: !reviewed
                                                  ? Colors.white
                                                  : Colors.grey.shade600,
                                              fontSize: 18)),
                                    )),
                                GestureDetector(
                                    onTap: () {
                                      reviewed = true;
                                      setState(() {});
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      height: height * 0.05,
                                      alignment: Alignment.center,
                                      width: width * 0.3,
                                      child: Text('Reviewed',
                                          style: TextStyle(
                                              color: !reviewed
                                                  ? Colors.grey.shade600
                                                  : Colors.white,
                                              fontSize: 18)),
                                    ))
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
      body: Center(
        child: Container(
          child: Column(children: [
            SizedBox(
              height: height * 0.1,
            ),
            Image.asset('assets/images/image 35.png', width: width * 0.5),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.02,horizontal:width*0.125),

              child: AutoSizeText(
                'Oh! Looks like you have not yet shopped any product',textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: width * 0.04,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:height*0.025),
              child: MaterialButton(
                padding: EdgeInsets.symmetric(vertical:height*0.015,horizontal:width*0.075 ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(width * 0.025)),
                onPressed: () {},
                child: Text('Shop Now',
                    style:
                    TextStyle(color: Colors.white, fontSize: width * 0.05)),
                color: Colors.green,
              ),)
          ]),
        ),
      ),
      bottomNavigationBar: Bottom(),
      floatingActionButton: fAB(width),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
