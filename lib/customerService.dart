import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';



class CustomerScreen extends StatefulWidget {
  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  double height, width;
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
                  'Customer Service',
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Positioned(
                right: width * 0.0575,
                top: height * 0.0575,
                child: Icon(
                  Icons.chat,
                  size: width * 0.075,
                  color: Colors.white,
                ))
          ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: AutoSizeText(
              'Hi Arvind, How can we help you today ?',
              style: TextStyle(
                  fontSize: width * 0.05, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.02),
            width: width,
            height: height * 0.02,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[400],
                    offset: Offset(0.0, -5.0),
                    spreadRadius: 2.0,
                    blurRadius: 3.0)
              ],
            ),
          ),
          Container(
            height: height * 0.075,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Text('View all Order',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.bold)),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: Colors.red,
                    size: width * 0.075,
                  )
                ])
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: height * 0.045),
            width: width,
            height: height * 0.02,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[400],
                    offset: Offset(0.0, 5.0),
                    spreadRadius: 2.0,
                    blurRadius: 3.0)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Popular Topics',
                  style: TextStyle(
                      fontSize: width * 0.05, fontWeight: FontWeight.bold)),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: width * .01, vertical: height * 0.01),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.05),
                        border: Border.all()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: width * 0.04),
                          child: Image.asset('assets/images/bag (1) 1.png'),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: width * 0.01),
                          child: AutoSizeText('My Orders',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2),
                        )
                      ],
                    ),
                    width: width * 0.2,
                    height: height * 0.125),
                Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: width * .01, vertical: height * 0.01),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.05),
                        border: Border.all()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: width * 0.04),
                          child: Image.asset('assets/images/voucher 1.png'),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: width * 0.01),
                          child: AutoSizeText('Payment and Vouchers',minFontSize: 5,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2),
                        )
                      ],
                    ),
                    width: width * 0.2,
                    height: height * 0.125),
                Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: width * .01, vertical: height * 0.01),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.05),
                        border: Border.all()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: width * 0.04),
                          child: Image.asset('assets/images/profile 1.png'),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: width * 0.01),
                          child: AutoSizeText('My Account',minFontSize: 5,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2),
                        )
                      ],
                    ),
                    width: width * 0.2,
                    height: height * 0.125),
                Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: width * .01, vertical: height * 0.01),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.05),
                        border: Border.all()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: width * 0.04),
                          child: Image.asset('assets/images/returning 1.png'),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: width * 0.01),
                          child: AutoSizeText('Return and Exchange',minFontSize: 5,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2),
                        )
                      ],
                    ),
                    width: width * 0.2,
                    height: height * 0.125),
              ]),
              Container(
                width:width*0.45,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: width * .01, vertical: height * 0.01),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * 0.05),
                          border: Border.all()),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: width * 0.04),
                            child: Image.asset('assets/images/warning 1.png'),
                          ),
                          Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: width * 0.01),
                            child: AutoSizeText('Report Issue',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 2),
                          )
                        ],
                      ),
                      width: width * 0.2,
                      height: height * 0.125),
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: width * .01, vertical: height * 0.01),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * 0.05),
                          border: Border.all()),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: width * 0.04),
                            child: Image.asset('assets/images/anonymity 1.png'),
                          ),
                          Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: width * 0.01),
                            child: AutoSizeText('General Queries',
                                style: TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 2),
                          )
                        ],
                      ),
                      width: width * 0.2,
                      height: height * 0.125),

                ]),
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
