import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'address.dart';
import 'components.dart';


List<String> time = [
  '9:30 am to 11:00 am',
  '12:00 am to 01:30 am',
  '2:30 am to 3:00 am',
  '4:00 am to 07:00 am'
];
enum Timings { morning, noon, afternoon, evening }
Timings _time = Timings.morning;



class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  bool asap = true;
  double height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width:width*0.75,
        height:height*0.05,
        child: MaterialButton(
          child: AutoSizeText('Checkout', style: TextStyle(fontSize:20,color: Colors.white)),
          color: Colors.green,
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
                return CheckOut();
              },),);
          },
        ),
      ) ,
      backgroundColor:Colors.white,
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
                  'Checkout',
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
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(children: [
                Icon(Icons.location_on_outlined, color: Colors.grey, size: 30),
                Text('Deliver to:',
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w600,
                        fontSize: 20)),
                Text('Default Address',
                    style: TextStyle(color: Colors.grey, fontSize: 20)),
              ]),
              MaterialButton(
                height: width * 0.075,
                minWidth: width * 0.1,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return AddressScreen();
                    }),
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(width * 0.01),
                    side: BorderSide(color: Colors.grey)),
                child: Text('Change'),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: height * 0.005,
            ),
            width: width * 0.9,
            child: AutoSizeText(
              'Suspendisse potenti. Nullam ac est erat. Morbi imperdiet et dolor sit amet facilisis. Vivamus consectetur.',
              style: TextStyle(fontSize: 15, color: Colors.grey),
              maxLines: 2,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.01),
            margin: EdgeInsets.symmetric(
              vertical: height * 0.01,
            ),
            width: width * 0.95,
            height: height * 0.075,
            decoration: BoxDecoration(
                color: Colors.grey.shade600,
                borderRadius: BorderRadius.circular(width * 0.01)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Image.asset(
                    'assets/images/Gift.png',
                    width: width * 0.1,
                  ),
                  SizedBox(width: width * 0.01),
                  Text('Is this a gift order ?',
                      style: TextStyle(fontSize: 16, color: Colors.white))
                ]),
                MaterialButton(
                  height: width * 0.075,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => Message(),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * 0.01),
                      side: BorderSide(color: Colors.white)),
                  child: Text('Add Message',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                )
              ],
            ),
          ),
          Visibility(
            visible: !asap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.01),
              margin: EdgeInsets.symmetric(
                vertical: height * 0.005,
              ),
              width: width * 0.95,
              height: height * 0.075,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Image.asset('assets/images/loading.png',width: width*0.1,),
                    Text('Delivery Time:',
                        style:
                        TextStyle(fontSize: 20, color: Colors.grey.shade600))
                  ]),
                  MaterialButton(
                    height: width * 0.075,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => DialogBox2(),
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.01),
                        side: BorderSide(color: Colors.grey.shade600)),
                    child: Text('Manage',
                        style:
                        TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                  )
                ],
              ),
            ),
          ),
          Row(children: [
            SizedBox(width:width*0.035),
            Icon(MaterialCommunityIcons.ticket_percent,color: Colors.grey,size: 30,),
            Text(
              '  Have a coupon code ?',
              style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
            )
          ]),
          Row(children: [
            SizedBox(width:width*0.035),
            TextButton(
              onPressed: () {},
              child: Text(
                'Apply Now',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
            )
          ]),
          customDivider(),
          Padding(
            padding: EdgeInsets.symmetric(vertical:height*0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: width * 0.4,
                  child: AutoSizeText('Default Delivery Option:',
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold),),
                ),
                Container(
                  width:width*0.4,
                  child:  AutoSizeText('1 Shipment\nDelivery Charges: Rs.50',
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ),
          customDivider(),
          Container(
            padding:EdgeInsets.symmetric(horizontal: width*0.1,vertical: height*0.01),
            child:Column(
                mainAxisSize:MainAxisSize.min,
                children:[
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Row(
                      children: [
                        Text('Bill Details', style: TextStyle(
                            fontSize: 22,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Cart Value', style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),),
                          Text('\u{20B9}322', style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),)
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Delivery Charges', style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),),
                          Text('\u{20B9}50', style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),)
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Saving', style: TextStyle(
                              fontSize: 15,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),),
                          Text('-\u{20B9}27', style: TextStyle(
                              fontSize: 15,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),)
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Order Total', style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),),
                          Text('\u{20B9}295', style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),)
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Amount to be Paid', style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),),
                          Text('\u{20B9}295', style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),)
                        ]),
                  )
                ]
            ),),


        ]),
      ),
    );
  }
}

class DialogBox2 extends StatefulWidget {
  @override
  _DialogBox2State createState() => _DialogBox2State();
}

class _DialogBox2State extends State<DialogBox2> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.green, width: 2)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.42,
        child: Column(
          children: [
            Text(
              'Delivery Time:',
              style: TextStyle(fontSize: 24),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.01,
              ),
              child: RadioList2(),
            ),
            // ignore: deprecated_member_use
            FlatButton(
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Confirm',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class RadioList2 extends StatefulWidget {
  @override
  _RadioList2State createState() => _RadioList2State();
}

class _RadioList2State extends State<RadioList2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          visualDensity: VisualDensity.compact,
          dense: true,
          title: Text(time[0],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15)),
          leading: Radio(
            value: Timings.morning,
            groupValue: _time,
            onChanged: (Timings value) {
              setState(() {
                _time = value;
              });
            },
          ),
        ),
        customDivider(),
        ListTile(
          visualDensity: VisualDensity.compact,
          dense: true,
          title: Text(time[1],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15)),
          leading: Radio(
            value: Timings.noon,
            groupValue: _time,
            onChanged: (Timings value) {
              setState(() {
                _time = value;
              });
            },
          ),
        ),
        customDivider(),
        ListTile(
          visualDensity: VisualDensity.compact,
          dense: true,
          title: Text(time[2],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15)),
          leading: Radio(
            value: Timings.afternoon,
            groupValue: _time,
            onChanged: (Timings value) {
              setState(() {
                _time = value;
              });
            },
          ),
        ),
        customDivider(),
        ListTile(
          visualDensity: VisualDensity.compact,
          dense: true,
          title: Text(time[3],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15)),
          leading: Radio(
            value: Timings.evening,
            groupValue: _time,
            onChanged: (Timings value) {
              setState(() {
                _time = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

class Message extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.green, width: 2),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            'Add Message',
            style: TextStyle(fontSize: 20),
          ),
          TextFormField(
            maxLines: 1,
            maxLength: 100,
          ),
          // ignore: deprecated_member_use
          FlatButton(
            color: Colors.green,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Confirm',
                style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
        ]),
      ),
    );
  }
}
