import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'cart.dart';
import 'checkout.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool details = false;
  PageController pageController = new PageController();
  ScrollController _scrollController = new ScrollController();
  TextEditingController textEditingController =
      new TextEditingController(text: '0');
  double width, height;
  int _curr = 0;
  @override
  void dispose() {
    _scrollController.dispose();
    textEditingController.dispose();// dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: false,
          toolbarHeight: height * 0.13,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: GestureDetector(
                                onTap: (){Navigator.of(context).pop();},
                                child: Icon(Icons.arrow_back_ios,
                                    size: width * 0.07, color: Colors.white),
                              ),
                            ),
                            SizedBox(width: width * 0.7),
                            Image.asset('assets/images/white ball.png',width: width*0.06,height:width*0.06),
                            GestureDetector(onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
                            }, child: Image.asset('assets/images/Group 6885 (2).png',width: width*0.09,height:width*0.09)),
                          ]),
                    ),
                    Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Container(
                            width: width * 0.85,
                            height: height * 0.05,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: height * 0.01),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 0.0,
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  fillColor: Colors.white,
                                  filled: true,
                                  prefixIcon:
                                      Icon(Icons.search, color: Colors.grey),
                                  hintText: 'Search 500+ products',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0.0))),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.all(height * 0.006),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: Icon(
                                Icons.mic_rounded,
                                color: Colors.green,
                              ))
                        ]))
                  ]),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          width: width * 0.75,
          height: height * 0.075,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(width * 0.1)),
            child: AutoSizeText('Add in Basket',
                style: TextStyle(fontSize: 20, color: Colors.white)),
            color: Colors.green,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return CheckOut();
                  },
                ),
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                height: height * 0.375,
                color: Colors.white,
                child: Material(
                  color: Colors.white,
                  elevation: 2,
                  child: Stack(children: [
                    PageView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      controller: pageController,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            child: Image.asset('assets/images/Group 6889.png',
                                width: width * 0.5)),
                        Container(
                          alignment: Alignment.center,
                          child: Image.asset('assets/images/image 18.png',
                              width: width * 0.5),
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: Image.asset('assets/images/image 16.png',
                                width: width * 0.5)),
                        Container(
                            alignment: Alignment.center,
                            child: Image.asset('assets/images/Group 6888.png',
                                width: width * 0.5)),
                      ],
                      onPageChanged: (num) {
                        setState(() {
                          _curr = num;
                        });
                      },
                    ),
                    Positioned(
                        top: height * 0.325,
                        right: width * 0.35,
                        left: width * 0.35,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  pageController.jumpToPage(0);
                                },
                                child: Icon(
                                  Icons.circle,
                                  size: (_curr == 0) ? 15 : 12,
                                  color:
                                      (_curr == 0) ? Colors.green : Colors.grey,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  pageController.jumpToPage(1);
                                },
                                child: Icon(
                                  Icons.circle,
                                  size: (_curr == 1) ? 15 : 12,
                                  color:
                                      (_curr == 1) ? Colors.green : Colors.grey,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  pageController.jumpToPage(2);
                                },
                                child: Icon(
                                  Icons.circle,
                                  size: (_curr == 2) ? 15 : 12,
                                  color:
                                      (_curr == 2) ? Colors.green : Colors.grey,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  pageController.jumpToPage(3);
                                },
                                child: Icon(
                                  Icons.circle,
                                  size: (_curr == 3) ? 15 : 12,
                                  color:
                                      (_curr == 3) ? Colors.green : Colors.grey,
                                ),
                              ),
                            ])),
                    Positioned(
                      top: height * 0.0425,
                      right: width * 0.0725,
                      child: Image.asset('assets/images/Vector1..png',
                          width: width * 0.0725),
                    )
                  ]),
                )),
            Container(
              padding: EdgeInsets.symmetric(horizontal:width * 0.045,vertical: height*0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.01, vertical: height * 0.005),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Red Apple', style: TextStyle(fontSize: width*0.06)),
                        Image.asset('assets/images/heart.png',
                            width: width * 0.075)
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.01, vertical: height * 0.005),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Row(
                              children: [
                                Text('\u20B9240',
                                    style: TextStyle(fontSize: width*0.05)),
                                SizedBox(width: width * 0.03),
                                Text('\u20B9290',
                                    style: TextStyle(
                                        fontSize: width*0.04,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough))
                              ],
                            ),
                            Container(
                              margin:
                                  EdgeInsets.symmetric(vertical: width * 0.01),
                              height: height * 0.025,
                              width: width * 0.15,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  AutoSizeText('\u20B9199',
                                      style: TextStyle(fontSize: width*0.04)),
                                  Image.asset('assets/images/logo1.png',
                                      width: width * 0.03)
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: width * 0.3,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (int.parse(textEditingController.text) >
                                        0)
                                      textEditingController.text = (int.parse(
                                                  textEditingController.text) -
                                              1)
                                          .toString();
                                  },
                                  child: Image.asset(
                                      'assets/images/akar-icons_circle-minus-fill.png',
                                      width: width * 0.0625),
                                ),
                                Container(
                                    padding: EdgeInsets.all(width * 0.01),
                                    margin: EdgeInsets.all(width * 0.02),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            width * 0.025),
                                        border: Border.all(width: 0.5)),
                                    width: width * 0.1,
                                    height: width * 0.1,
                                    alignment: Alignment.center,
                                    child: TextField(
                                      textAlign: TextAlign.center,
                                      showCursor: false,
                                      onEditingComplete: () {
                                        if (textEditingController.text.length ==
                                            0) {
                                          textEditingController.text = "0";
                                          setState(() {});
                                        }
                                        FocusScope.of(context).unfocus();
                                      },
                                      onTap: () {
                                        if (textEditingController.text == '0') {
                                          textEditingController.text = "";
                                          setState(() {});
                                        }
                                      },
                                      controller: textEditingController,
                                      cursorWidth: 0,
                                      enableInteractiveSelection: false,
                                      keyboardType: TextInputType.number,
                                      maxLength: 2,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                        counterText: '',
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 0,
                                              color: Colors.transparent),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 0,
                                              color: Colors.transparent),
                                        ),
                                      ),
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    textEditingController.text =
                                        (int.parse(textEditingController.text) +
                                                1)
                                            .toString();
                                  },
                                  child: Image.asset(
                                      'assets/images/Group 6814.png',
                                      width: width * 0.0625),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  details = !details;
                  if (details == true)
                    _scrollController.animateTo(height * 0.05,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeOut);
                  else
                    _scrollController.animateTo(0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: height * 0.0012),
                color: Colors.transparent,
                padding: EdgeInsets.symmetric(horizontal:width * 0.045,vertical:height*0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Detail',
                      style: TextStyle(fontSize: 20),
                    ),
                    Transform.rotate(
                      angle: details ? pi / 2 : pi * 1.5,
                      child: Icon(Icons.arrow_forward_ios_outlined),
                    )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: details,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.045),
                height: height * 0.3,
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
                  ' sed do eiusmod tempor incididunt ut labore et dolore '
                  'magna aliqua. Ut enim ad minim veniam, quis nostrud ',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ]),
        ));
  }
}
