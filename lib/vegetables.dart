
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components.dart';
import 'package:flutter/rendering.dart';



class Vegetables extends StatefulWidget {
  @override
  _VegetablesState createState() => _VegetablesState();
}

class _VegetablesState extends State<Vegetables> with SingleTickerProviderStateMixin{
  bool _showAppbar = true;
  ScrollController _scrollBottomBarController = new ScrollController();
  bool isScrollingDown = false;
  bool _show = true;
  bool _showImage = true;
  double bottomBarHeight = 75;
  double _bottomBarOffset = 0;

  @override
  void initState() {
    super.initState();
    myScroll();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollBottomBarController.removeListener(() {});
    super.dispose();
  }

  void showBottomBar() {
    setState(() {
      _show = true;
    });
  }

  void hideBottomBar() {
    setState(() {
      _show = false;
    });
  }

  void myScroll() async {
    _scrollBottomBarController.addListener(() {
      if (_scrollBottomBarController.offset <= _scrollBottomBarController.position.minScrollExtent &&
          !_scrollBottomBarController.position.outOfRange) {
        if(_showImage==false) {
          setState(() {
            _showImage = true;
          });
        }
      }
      else  {
        setState(() {
          _showImage=false;
        });
      }
      if (_scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          hideBottomBar();
        }
      }
      if (_scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          showBottomBar();
        }
      }
    });
  }


  double height, width;
  List <String> list1 = ['assets/images/Group 293.png','assets/images/Group 6891.png','assets/images/Group 6856.png','assets/images/Group 6857.png','assets/images/Group 6858.png','assets/images/Group 6859.png'];
  List <String> list2 = ['assets/images/Group 293 (1).png','assets/images/Group 6892.png','assets/images/Group 6856 (1).png','assets/images/Group 6857.png','assets/images/Group 6858.png','assets/images/Group 6859.png'];
  List <String> list3 = ['assets/images/Group 293 (2).png','assets/images/Group 6893.png','assets/images/Group 6856 (2).png','assets/images/Group 6857.png','assets/images/Group 6858.png','assets/images/Group 6859.png'];
  List <String> list4 = ['assets/images/Group 293 (3).png','assets/images/Group 6894.png','assets/images/Group 6856 (3).png','assets/images/Group 6857.png','assets/images/Group 6858.png','assets/images/Group 6859.png'];




  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar:  PreferredSize(
          preferredSize: Size.fromHeight(height * 0.225),
          child: AnimatedContainer(
            height: _showAppbar? height * 0.300: 0,
            duration: Duration(milliseconds:1000),
            curve: _showAppbar ? Curves.fastOutSlowIn : Curves.fastLinearToSlowEaseIn,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: Stack(children: [
                Container(),
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(width * 0.15),
                        bottomLeft: Radius.circular(width * 0.15)),
                    child: Image.asset(
                      'assets/images/Rectangle130.png',
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
                      'Vegetables',
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
                  child: AnimatedContainer(
                    duration:Duration(milliseconds: 2000),
                    padding: EdgeInsets.all(width * 0.03),
                    height: _showImage ? width * 0.275 : 0,
                    width: _showImage ? width * 0.275 : 0,
                    curve: Curves.easeInOut ,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade500,
                          offset:  Offset(
                            2.0,
                            2.0,
                          ),
                          blurRadius: 5.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.white,
                          offset:  Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset('assets/images/vegetables.png', fit: BoxFit.cover)),
                  ),
                )
              ]),
            ),
          ),
        ),


        body: SingleChildScrollView(
          controller: _scrollBottomBarController,
            child:Column(
                children:[
                  SizedBox(height:height*0.275),
                  Center(child: AutoSizeText('Vegetable',style:GoogleFonts.merriweather(fontSize:24,color:Colors.grey.shade600),)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width*0.1,vertical: height*0.01),
                    child: Center(child: AutoSizeText('Any vegetable or 100% vegetable juice counts as part of the Vegetable group.',style: TextStyle(fontSize:15),maxLines: 2,textAlign: TextAlign.center,)),
                  ),
                  customDivider(),
                  categoryName(width,'Plant Vegetable'),
                  categoryList(width,list1),
                  customDivider(),

                  Image.asset('assets/images/image 19.png'),
                  customDivider(),
                  categoryName(width,'Creepers Vegetable'),

                  categoryList(width,list2),
                  customDivider(),

                  Image.asset('assets/images/Group 6886 (2).png'),
                  customDivider(),
                  categoryName(width,'Leafy Vegetable'),

                  categoryList(width,list3),
                  customDivider(),

                  Image.asset('assets/images/Group 6887 (3).png'),
                  customDivider(),
                  categoryName(width,'Root Vegetable'),

                  categoryList(width,list4),
                  SizedBox(height:height*0.125),


                ]
            )
        ),
        floatingActionButton: fAB(width),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Bottom()
    );
  }
}


