import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'components.dart';

class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  void initState() {
    super.initState();
    reset();
  }
  reset2() {
    for (int i = 0; i < 3; i++) {
      _click[i] = false;
    }
  }

  List<bool> _click = [true, false, false];
  double height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.1),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Stack(children: [
            Container(),
            ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(width * 0.075),
                    bottomLeft: Radius.circular(width * 0.075)),
                child: Container(color: Colors.green, height: height * 0.12)),
            Positioned(
              top: height * 0.05,
              left: width * 0.2,
              right: width * 0.2,
              child: Container(
                alignment: Alignment.center,
                child: AutoSizeText(
                  'Add New Address',
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ]),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: width * 0.025),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                'Personal Details',
                style: TextStyle(fontSize: width*0.0625),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Container(
                  width: width * 0.4,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'First Name'),
                  ),
                ),
                Container(
                  width: width * 0.4,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Last Name'),
                  ),
                ),
              ]),
              SizedBox(height: height * 0.01),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Container(
                  width: width * 0.85,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Contact Number'),
                  ),
                ),
              ]),
              Padding(
                padding: EdgeInsets.only(top: width * 0.075),
                child: AutoSizeText(
                  'Address Details',
                  style: TextStyle(fontSize: width*0.0625),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Container(
                  width: width * 0.4,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'House No.'),
                  ),
                ),
                Container(
                  width: width * 0.4,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Apartment name'),
                  ),
                ),
              ]),
              SizedBox(height: height * 0.01),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Container(
                  width: width * 0.85,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Street Details'),
                  ),
                ),
              ]),
              SizedBox(height: height * 0.01),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Container(
                  width: width * 0.85,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Landmark'),
                  ),
                ),
              ]),
              SizedBox(height: height * 0.01),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Container(
                  width: width * 0.85,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Area Details'),
                  ),
                ),
              ]),
              SizedBox(height: height * 0.01),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Container(
                  width: width * 0.4,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'City'),
                  ),
                ),
                Container(
                  width: width * 0.4,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Pincode'),
                  ),
                ),
              ]),
              Padding(
                padding: EdgeInsets.only(
                    bottom: width * 0.025,
                    top: width * 0.075,
                    right: width * 0.025,
                    left: width * 0.025),
                child: AutoSizeText(
                  'Address Type',
                  style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                GestureDetector(
                  onTap: () {
                    reset2();
                    _click[0] = true;
                    setState(() {});
                  },
                  child: Container(
                      padding: EdgeInsets.all(width * 0.0375),
                      decoration: BoxDecoration(
                          color: _click[0] ? Colors.green : Colors.white,
                          borderRadius: BorderRadius.circular(width * 0.05),
                          border: Border.all(color: Colors.grey)),
                      child: Text('Home',
                          style: TextStyle(
                              fontSize: width*0.05,
                              color: _click[0] ? Colors.white : Colors.black)),
                      alignment: Alignment.center),
                ),
                GestureDetector(
                  onTap: () {
                    reset2();
                    _click[1] = true;
                    setState(() {});
                  },
                  child: Container(
                      padding: EdgeInsets.all(width * 0.0375),
                      decoration: BoxDecoration(
                          color: _click[1] ? Colors.green : Colors.white,
                          borderRadius: BorderRadius.circular(width * 0.05),
                          border: Border.all(color: Colors.grey)),
                      child: Text('Work',
                          style: TextStyle(
                              fontSize: width*0.05,
                              color: _click[1] ? Colors.white : Colors.black)),
                      alignment: Alignment.center),
                ),
                GestureDetector(
                  onTap: () {
                    reset2();
                    _click[2] = true;
                    setState(() {});
                  },
                  child: Container(
                      padding: EdgeInsets.all(width * 0.0375),
                      decoration: BoxDecoration(
                          color: _click[2] ? Colors.green : Colors.white,
                          borderRadius: BorderRadius.circular(width * 0.05),
                          border: Border.all(color: Colors.grey)),
                      child: Text('Others',
                          style: TextStyle(
                              fontSize: width*0.05,
                              color: _click[2] ? Colors.white : Colors.black)),
                      alignment: Alignment.center),
                ),
              ]),
              SizedBox(height: height * 0.05),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('ADD', style: TextStyle(fontSize: width * 0.075)),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.1))),
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                        horizontal: width * 0.25, vertical: width * 0.015),),),
                ),),
              SizedBox(height: height*0.125,)
            ],
          ),
        ),
      ),
      floatingActionButton: fAB(width),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Bottom(),
    );
  }
}
