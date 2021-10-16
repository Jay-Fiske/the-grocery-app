import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'components.dart';



class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double height, width;
  bool asap = true;
  String dropDownData=variation[1];
  TextEditingController textEditingController1 =
  new TextEditingController(text: '1');
  TextEditingController textEditingController2 =
  new TextEditingController(text: '1');
  TextEditingController textEditingController3 =
  new TextEditingController(text: '1');
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
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
              left: width * 0.3,
              right: width * 0.3,
              child: Container(
                alignment: Alignment.center,
                child: AutoSizeText(
                  'Cart',
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
                          left: asap ? width * 0.01 : width * 0.35,
                          right: asap ? width * 0.35 : width * 0.01,
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
                                      asap = true;
                                      setState(() {});
                                    },
                                    child: Container(
                                      width: width * 0.3,
                                      height: height * 0.05,
                                      color: Colors.transparent,
                                      alignment: Alignment.center,
                                      child: Text('ASAP',
                                          style: TextStyle(
                                              color: asap
                                                  ? Colors.white
                                                  : Colors.grey.shade600,
                                              fontSize: 18)),
                                    )),
                                GestureDetector(
                                    onTap: () {
                                      asap = false;
                                      setState(() {});
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      height: height * 0.05,
                                      alignment: Alignment.center,
                                      width: width * 0.3,
                                      child: Text('Schedule',
                                          style: TextStyle(
                                              color: asap
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
        child: Column(
          children: [
            Container(),
            CartProduct(title: "Fresh Banana",image: "assets/images/mkl.png",dp: "25",op:"35",txt: textEditingController1,),
            CartProduct(title: "Fresh Apple",image: "assets/images/Group 6888.png",dp: "135",op:"190",txt: textEditingController2,),
            CartProduct(title: "Fresh Green Apple",image: "assets/images/Group 6890.png",dp: "140",op:"155",txt: textEditingController3,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text('Delivery: \u20B950',style: TextStyle(fontSize: 18),),
                    Text('Total: \u20B9345',style: TextStyle(fontSize: 20,color:Colors.blue),),
                    Text('Save: \u20B927',style: TextStyle(fontSize: 18),),
                  ]

              ),
                SizedBox(width:width*0.1)
              ],

            )
          ],
        ),
      ),
    );
  }
}
