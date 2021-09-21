import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components.dart';
class Fruits extends StatefulWidget {
  @override
  _FruitsState createState() => _FruitsState();
}

class _FruitsState extends State<Fruits> {
  double height, width;
  List<String> list1 = [
    'assets/images/Group 293 (5).png',
    'assets/images/Group 6895.png',
    'assets/images/Group 6856 (4).png',
    'assets/images/Group 6857.png',
    'assets/images/Group 6858.png',
    'assets/images/Group 6859.png'
  ];
  List<String> list2 = [
    'assets/images/Group 293 (5).png',
    'assets/images/Group 6896.png',
    'assets/images/Group 6856 (5).png',
    'assets/images/Group 6857.png',
    'assets/images/Group 6858.png',
    'assets/images/Group 6859.png'
  ];
  List<String> list3 = [
    'assets/images/Group 293 (6).png',
    'assets/images/Group 6897.png',
    'assets/images/Group 6856 (6).png',
    'assets/images/Group 6857.png',
    'assets/images/Group 6858.png',
    'assets/images/Group 6859.png'
  ];
  List<String> list4 = [
    'assets/images/Group 293 (7).png',
    'assets/images/Group 6898.png',
    'assets/images/Group 6856 (7).png',
    'assets/images/Group 6857.png',
    'assets/images/Group 6858.png',
    'assets/images/Group 6859.png'
  ];
  List<String> list5 = [
    'assets/images/Group 293 (8).png',
    'assets/images/Group 6899.png',
    'assets/images/Group 6856 (8).png',
    'assets/images/Group 6857.png',
    'assets/images/Group 6858.png',
    'assets/images/Group 6859.png'
  ];
  List<String> list6 = [
    'assets/images/Group 293 (9).png',
    'assets/images/Group 6900.png',
    'assets/images/Group 6856 (9).png',
    'assets/images/Group 6857.png',
    'assets/images/Group 6858.png',
    'assets/images/Group 6859.png'
  ];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: customAppBar(
            height,
            width,
            'assets/images/Rectangle131.png',
            'assets/images/fruits.png',
            'Fruits'),
        body: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: height * 0.275),
              Center(
                  child: AutoSizeText(
                    'Fruit',
                    style: GoogleFonts.merriweather(
                        fontSize: 24, color: Colors.grey.shade600),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.1, vertical: height * 0.01),
                child: Center(
                    child: AutoSizeText(
                      'Eating more fruit is an excellent way to improve overall health and reduce the risk of disease.',
                      style: TextStyle(fontSize: 15),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    )),
              ),
              customDivider(),
              categoryName(width, 'Tropical Fruit'),
              categoryList(width, list1),
              customDivider(),
              Image.asset('assets/images/Group 6880.png'),
              customDivider(),
              categoryName(width, 'Berries Fruit'),
              categoryList(width, list2),
              customDivider(),
              Image.asset('assets/images/carousel2.png'),
              customDivider(),
              categoryName(width, 'Pome Fruit'),
              categoryList(width, list3),
              customDivider(),
              Image.asset('assets/images/Group 6878.png'),
              customDivider(),
              categoryName(width, 'Drupes Fruit'),
              categoryList(width, list4),
              customDivider(),
              Image.asset('assets/images/fruits2.png'),
              customDivider(),
              categoryName(width, 'Melon Fruit'),
              categoryList(width, list5),
              customDivider(),
              Image.asset('assets/images/fruits3.png'),
              customDivider(),
              categoryName(width, 'Citrum Fruit'),
              categoryList(width, list6),
              SizedBox(height: height * 0.125),
            ])),
        floatingActionButton: fAB(width),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Bottom());
  }
}
