import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';




class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  double height, width;
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
                  'Order Details',
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
                                      child: AutoSizeText('Summary',
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
                                      child: Text('Items',
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
      body: reviewed ? SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/images/vector21.png',
                width: width * 0.05,
              ),
              AutoSizeText('  Item in this order cannot be returned.  '),
              Text('Read more',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ))
            ]),
            Container(
              margin: EdgeInsets.only(top: height * 0.01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.01),
                border: Border.all(color: Colors.grey),
                color: Colors.green.shade50,
              ),
              width: width,
              height: height * 0.06,
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: Image.asset(
                    'assets/images/image 62.png',
                    width: width * 0.05,
                  ),
                ),
                SizedBox(width: width * 0.05),
                AutoSizeText('Delivery on',
                    style: TextStyle(fontSize: width * 0.05)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  child: AutoSizeText('5 sep',
                      style: TextStyle(
                          fontSize: width * 0.05, color: Colors.green)),
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.05),
              child: Text('Items:', style: TextStyle(fontSize: width * 0.04)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.01),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                    child: Image.asset(
                      'assets/images/image 18.png',
                      width: width * 0.15,
                    ),
                  ),
                  AutoSizeText('Kashmiri Apple',
                      style: TextStyle(fontSize: width * 0.05)),
                  SizedBox(width: width * 0.3),
                  Image.asset(
                    'assets/images/image 41.png',
                    width: width * 0.075,
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              height: height * 0.1,
              alignment: Alignment.bottomCenter,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Qty: 1', style: TextStyle(fontSize: width * 0.05)),
                    SizedBox(width: width * 0.25),
                    Text(
                      'Save 17.00 %  ',
                      style: TextStyle(
                        fontSize: width * 0.03,
                        color: Colors.green,
                      ),
                    ),
                    Text('\u{20B9}240.00*',
                        style: TextStyle(fontSize: width * 0.05))
                  ]),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: height * 0.025),
              child: Row(children: [
                Image.asset(
                  'assets/images/Group 6912.png',
                  width: width * 0.1,
                ),
                Text('  Bill Details',
                    style: TextStyle(
                        fontSize: width * 0.05, fontWeight: FontWeight.bold)),
              ]),
            ),
            Container(
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(left: width * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Order Items: ',
                          style: TextStyle(
                              color: Colors.grey, fontSize: width * 0.04)),
                      Row(children: [
                        Text(
                          '2 Items',
                          style: TextStyle(
                              color: Colors.green, fontSize: width * 0.04),
                        ),
                        Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.green, size: width * 0.05)
                      ]),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.01),
                Container(
                  margin: EdgeInsets.only(left: width * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Order Total: ',
                          style: TextStyle(
                              color: Colors.grey, fontSize: width * 0.04)),
                      Row(children: [
                        Text(
                          '\u{20B9}295.00',
                          style: TextStyle(fontSize: width * 0.04),
                        ),
                      ]),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.01),
                Container(
                  margin:
                  EdgeInsets.only(top: height * 0.01, left: width * 0.1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.01),
                    border: Border.all(color: Colors.green),
                  ),
                  width: width,
                  height: height * 0.06,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: width * 0.03),
                            child: Text('View Invoice',
                                style: TextStyle(
                                  color: Colors.green,
                                ))),
                        SizedBox(width: width * 0.05),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: width * 0.05,
                          color: Colors.green,
                        ),
                      ]),
                ),
              ]),
            ),
            Container(
              padding: EdgeInsets.all(height * 0.015),
              margin: EdgeInsets.symmetric(vertical: height * 0.035),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(width * 0.01)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/images/image 67.png',
                    width: width * 0.05,
                  ),
                  AutoSizeText(
                    'Total saving of 35.00 on this order',
                    style:
                    TextStyle(fontSize: width * 0.05, color: Colors.green),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ):SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.01),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/images/vector21.png',
                width: width * 0.05,
              ),
              AutoSizeText('  Item in this order cannot be returned.  '),
              Text('Read more',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ))
            ]),
          ),
          Container(
            margin: EdgeInsets.only(
                top: height * 0.01, left: width * 0.03, right: width * 0.03),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width * 0.01),
              border: Border.all(color: Colors.grey),
              color: Colors.green.shade50,
            ),
            width: width,
            height: height * 0.06,
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: Image.asset(
                  'assets/images/image 62.png',
                  width: width * 0.05,
                ),
              ),
              SizedBox(width: width * 0.05),
              AutoSizeText('Delivery on',
                  style: TextStyle(fontSize: width * 0.05)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: AutoSizeText('5 sep',
                    style:
                    TextStyle(fontSize: width * 0.05, color: Colors.green)),
              )
            ]),
          ),
          Container(
              height: height * 0.1,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: width * 0.45,
                        height: height * 0.1,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Receiver Name:',
                                  style: TextStyle(
                                      fontSize: width * 0.035, color: Colors.grey)),
                              Text('Aviral Chaudhary',
                                  style: TextStyle(fontSize: width * 0.045,fontWeight: FontWeight.bold))
                            ])),
                    Container(
                        width: width * 0.3,
                        height: height * 0.1,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Order No:',
                                  style: TextStyle(
                                      fontSize: width * 0.035, color: Colors.grey)),
                              Text('F41056483',
                                  style: TextStyle(fontSize: width * 0.045,fontWeight: FontWeight.bold))
                            ])),
                  ])),
          Container(
            margin: EdgeInsets.only(
                top: height * 0.01, left: width * 0.03, right: width * 0.03,bottom:height*0.02),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width * 0.01),
              border: Border.all(color: Colors.grey),
              color: Colors.green.shade50,
            ),
            width: width,
            height: height * 0.06,
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: Image.asset(
                  'assets/images/WhatsApp_Image_2021-07-20_at_6.42 1.png',
                ),
              ),
              SizedBox(width: width * 0.05),

              Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  AutoSizeText('Items were safely packed and deliver to your doorstep',
                      style: TextStyle(fontSize: width * 0.03)),
                  AutoSizeText('Know More',
                      style: TextStyle(fontSize: width * 0.035,color:Colors.blue)),

                ],
              )
            ]),
          ),

          Container(
              width: width, height: height * 0.01, color: Colors.grey.shade200),
          Container(
            alignment: Alignment.center,
            height: height * 0.1,
            color: Colors.grey.shade50,
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.05, vertical: height * 0.0075),
                    child: Image.asset(
                      'assets/images/check 1.png',
                      width: width * 0.08,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.0075,
                  ),
                  AutoSizeText('Order Confirmed',
                      style: TextStyle(
                          fontSize: width * 0.05, fontWeight: FontWeight.bold)),
                ]),
                Row(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Text('Show Status Details',
                        style: TextStyle(
                            color: Colors.green, fontSize: width * 0.05)),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.green,
                    size: width * 0.075,
                  )
                ])
              ],
            ),
          ),
          Container(
              width: width, height: height * 0.01, color: Colors.grey.shade200),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.025, horizontal: width * 0.045),
            child: Row(children: [
              Image.asset(
                'assets/images/Group 6912.png',
                width: width * 0.1,
              ),
              Text('  Bill Details',
                  style: TextStyle(
                      fontSize: width * 0.05, fontWeight: FontWeight.bold)),
            ]),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.045),
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(left: width * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Order Items: ',
                        style: TextStyle(
                            color: Colors.grey, fontSize: width * 0.04)),
                    Row(children: [
                      Text(
                        '2 Items',
                        style: TextStyle(
                            color: Colors.green, fontSize: width * 0.04),
                      ),
                      Icon(Icons.arrow_forward_ios_outlined,
                          color: Colors.green, size: width * 0.05)
                    ]),
                  ],
                ),
              ),
              SizedBox(height: height * 0.01),
              Container(
                margin: EdgeInsets.only(left: width * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Order Total: ',
                        style: TextStyle(
                            color: Colors.grey, fontSize: width * 0.04)),
                    Row(children: [
                      Text(
                        '\u{20B9}295.00',
                        style: TextStyle(fontSize: width * 0.04),
                      ),
                    ]),
                  ],
                ),
              ),
              SizedBox(height: height * 0.01),
              Container(
                margin: EdgeInsets.only(top: height * 0.01, left: width * 0.1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 0.01),
                  border: Border.all(color: Colors.green),
                ),
                width: width,
                height: height * 0.06,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: width * 0.03),
                          child: Text('View Invoice',
                              style: TextStyle(
                                color: Colors.green,
                              ))),
                      SizedBox(width: width * 0.05),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: width * 0.05,
                        color: Colors.green,
                      ),
                    ]),
              ),
            ]),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.025, horizontal: width * 0.045),
            child: Row(children: [
              Image.asset(
                'assets/images/Group 6913.png',
                width: width * 0.1,
              ),
              Text('  Payment Details',
                  style: TextStyle(
                      fontSize: width * 0.05, fontWeight: FontWeight.bold)),
            ]),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.045),
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(left: width * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('4th August 2021, 14:36',
                        style: TextStyle(
                            color: Colors.grey, fontSize: width * 0.04)),

                  ],
                ),
              ),
              SizedBox(height: height * 0.01),
              Container(
                margin: EdgeInsets.only(left: width * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Online: ',
                        style: TextStyle(
                            color: Colors.grey, fontSize: width * 0.04)),
                    Row(children: [
                      Text(
                        '\u{20B9}295.00',
                        style: TextStyle(fontSize: width * 0.04),
                      ),
                    ]),
                  ],
                ),
              ),
              SizedBox(height: height * 0.01),
              SizedBox(height:height*0.075)
            ]),
          ),

        ]),
      ),
      floatingActionButton: MaterialButton(onPressed: () {  },minWidth: width*0.9,
        color: Colors.green, child: Text('Reorder',style: TextStyle(fontSize:width*0.05,color:Colors.white),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
