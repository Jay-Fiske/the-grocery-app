import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'components.dart';


class ReviewScreen extends StatefulWidget {
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  double height, width;
  bool reviewed = true;
  List<bool> star = [true, true, true, false, false];
  rating(int i) {
    for (int j = 0; j <= i; j++) {
      star[j] = true;
    }
    for (int k = i + 1; k <= 4; k++) {
      star[k] = false;
    }

    setState(() {});
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(children: [
            Visibility(visible: !reviewed,child: MyReview(title: 'Kashmiri Apple',days: '1',img: 'assets/images/image 18.png',price: '240.00',)),
            Visibility(visible: !reviewed,child: MyReview(title: 'Fresh Banana',days: '3',img: 'assets/images/mkl.png',price: '193.00',)),
            Visibility(visible: reviewed,child: MyReview2(title: 'Kashmiri Apple',days: '1',img: 'assets/images/image 18.png',price: '240.00',rating:'2',description: 'Fresh',weight: '500gm',)),
            Visibility(visible: reviewed,child: MyReview2(title: 'Fresh Banana',days: '2',img: 'assets/images/mkl.png',price: '193.00',rating:'3',description: 'Such a good product',weight: '500gm',))
          ]),
        ),
      ),
    );
  }
}
