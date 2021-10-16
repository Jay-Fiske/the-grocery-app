import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components.dart';
import 'package:flutter/rendering.dart';

class Fruits extends StatefulWidget {
  @override
  _FruitsState createState() => _FruitsState();
}

class _FruitsState extends State<Fruits>
    with SingleTickerProviderStateMixin {
  bool _showAppbar = true;
  ScrollController _scrollBottomBarController = new ScrollController();
  bool isScrollingDown = false;
  bool _showImage = true;
  double initialOffset = 0.0;

  @override
  void initState() {
    super.initState();
    myScroll();
  }

  void myScroll() async {
    _scrollBottomBarController.addListener(() {
      if (_scrollBottomBarController.offset <=
          _scrollBottomBarController.position.minScrollExtent &&
          !_scrollBottomBarController.position.outOfRange) {
        if (_showImage == false) {
          setState(() {
            _showImage = true;
          });
        }
      } else {
        setState(() {
          _showImage = false;
        });
      }
      if ((_scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.reverse) &&
          ((_scrollBottomBarController.offset - initialOffset).abs() > 50)) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          initialOffset = (_scrollBottomBarController.offset);
          setState(() {});
        }
      }
      if ((_scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.forward) &&
          ((_scrollBottomBarController.offset - initialOffset).abs() > 50)) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
  }

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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.225),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 1000),
            opacity: _showAppbar ? 1.0 : 0.0,
            child: AnimatedContainer(
              height: _showImage
                  ? height * 0.3
                  : _showAppbar
                      ? height * 0.15
                      : 0,
              duration: Duration(milliseconds: 1000),
              curve: _showAppbar
                  ? Curves.fastOutSlowIn
                  : Curves.fastLinearToSlowEaseIn,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                flexibleSpace: Stack(children: [
                  Container(),
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(width * 0.125),
                          bottomLeft: Radius.circular(width * 0.125)),
                      child: Image.asset(
                        'assets/images/Rectangle131.png',
                        width: width,
                        fit: BoxFit.cover,
                        height: height * 0.2,
                        colorBlendMode: BlendMode.modulate,
                        color: Colors.grey.shade500,
                      )),
                  Positioned(
                    top: height * 0.05,
                    left: width * 0.3,
                    right: width * 0.3,
                    child: Container(
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        'Fruits',
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * 0.125,
                    left: width * 0.35,
                    right: width * 0.35,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 500),
                      opacity: _showImage ? 1.0 : 0.0,
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        padding: EdgeInsets.all(width * 0.03),
                        height: _showImage ? width * 0.275 : 0,
                        width: _showImage ? width * 0.275 : 0,
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade500,
                              offset: Offset(
                                2.0,
                                2.0,
                              ),
                              blurRadius: 5.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset('assets/images/fruits.png',
                                fit: BoxFit.cover)),
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ),
        ),

        body: SingleChildScrollView(
            controller: _scrollBottomBarController,
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
