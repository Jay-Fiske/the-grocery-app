import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'address.dart';
import 'components.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.25),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Stack(children: [
            Container(),
            ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(width * 0.125),
                    bottomLeft: Radius.circular(width * 0.125)),
                child: Container(color: Colors.green, height: height * 0.25)),
            Positioned(
              top: height * 0.05,
              left: width * 0.3,
              right: width * 0.3,
              child: Container(
                alignment: Alignment.center,
                child: AutoSizeText(
                  'My Profile',
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: width*0.065,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Positioned(
              top: height * 0.1,
              left: width * 0.1,
              right: width * 0.3,
              child: Container(
                child: AutoSizeText(
                  'Address',
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width*0.05,
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.13,
              left: width * 0.08,
              right: width * 0.05,
              child: Container(
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                        size: width * 0.075, color: Colors.white),
                    AutoSizeText(
                      'Surat -395007',
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: width*0.05,
                      ),
                    ),
                    SizedBox(width: width * 0.4),
                    Image.asset(
                      'assets/images/white pen.png',
                      width: width * 0.05,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: height * 0.185,
              right: width * 0.05,
              left: width * 0.05,
              child: Container(
                width: width * 0.9,
                height: height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(width * 0.05),
                ),
                child: Material(
                  elevation: width * 0.025,
                  borderRadius: BorderRadius.circular(width * 0.0275),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.025),
                    child: Row(children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://wallpaperaccess.com/full/2213424.jpg'),
                        radius: width * 0.0625,
                      ),
                      SizedBox(width: width * 0.05),
                      Expanded(
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: AutoSizeText('John Doe',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    )),
                              ),
                              Container(
                                  height: height * 0.00125,
                                  width: width * 0.5,
                                  color: Colors.grey),
                              SizedBox(height: height * 0.01),
                              AutoSizeText('0983923844',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey)),
                              Container(
                                  height: height * 0.00125,
                                  width: width * 0.5,
                                  color: Colors.grey),
                            ]),
                      ),
                      SizedBox(width: width * 0.05),
                      Image.asset(
                        'assets/images/pen.png',
                        width: width * 0.045,
                      )
                    ]),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.045),
        child: Container(
            width: width,
            height: height * 0.9,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(width * 0.05)),
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(width * 0.05),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                          children:[
                            Icon(Icons.watch_later),
                            SizedBox(width:width*0.01),
                            Text('My Orders',style:(TextStyle(fontSize:20,color:Colors.grey.shade700)))
                          ]
                      ),
                    ),
                    customDivider2(height,width),
                    rowElement(height,width,'assets/images/wallet.png','My Wallet'),
                    customDivider2(height,width),
                    rowElement(height,width,'assets/images/image 34.png','My Rating & Reviews'),
                    customDivider2(height,width),
                    rowElement(height,width,'assets/images/ball.png','Notifications'),
                    customDivider2(height,width),
                    rowElement(height,width,'assets/images/headphone.png','Customer Service'),
                    customDivider2(height,width),
                    GestureDetector(
                      onTap: (){ Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddressScreen(),
                          ));},
                        child: rowElement(height,width,'assets/images/black location.png','My Delivery Address')),
                    customDivider2(height,width),
                    rowElement(height,width,'assets/images/Logout.png','Logout'),
                  ]

              ),
            )),
      ),
      floatingActionButton: fAB(width),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Bottom(),
    );
  }
}
