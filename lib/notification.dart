import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'components.dart';

class SingleScreen extends StatefulWidget {
  @override
  _SingleScreenState createState() => _SingleScreenState();
}

class _SingleScreenState extends State<SingleScreen> {
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
      body: Padding(
        padding: EdgeInsets.only(
            left: width * 0.05, right: width * 0.05, bottom: height * 0.05),
        child: Container(
          height: height * 0.9,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(width * 0.05)),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(width * 0.05),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: height * 0.02),
                notification(
                  'assets/images/Vector 17.png',
                  'Phasellus in feugiat turpis, sit.',
                  'Pellentesque pharetra ac urna ut Nunc udin sed est.',
                  '11:00AM',
                  'August 26,2021',
                  height,
                  width,
                ),
                Divider(),
                notification(
                  'assets/images/Vector 16.png',
                  'In auctor lorem nec rutrum.',
                  'Pellentesque pharetra ac urna ut Nunc udin sed est.',
                  '11:00AM',
                  'August 26,2021',
                  height,
                  width,
                ),
                Divider(),
                notification(
                  'assets/images/Vector 16.png',
                  'Donec sed dolor feugiat, ullamcorper.',
                  'Pellentesque pharetra ac urna ut Nunc udin sed est.',
                  '11:00AM',
                  'August 26,2021',
                  height,
                  width,
                ),
                Divider(),
                notification(
                  'assets/images/Vector 19.png',
                  'Quisque eu elit at risus.',
                  'Pellentesque pharetra ac urna ut Nunc udin sed est.',
                  '11:00AM',
                  'August 26,2021',
                  height,
                  width,
                ),
                Divider(),
                notification(
                  'assets/images/Vector 19.png',
                  'Phasellus in feugiat turpis, sit.',
                  'Pellentesque pharetra ac urna ut Nunc udin sed est.',
                  '11:00AM',
                  'August 26,2021',
                  height,
                  width,
                ),
              ]),
            ),
          ),
        ),
      ),
      floatingActionButton: fAB(width),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Bottom(),
    );
  }
}
