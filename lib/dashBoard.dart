import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/profile.dart';
import 'package:grocery_app/searchScreen.dart';
import 'package:grocery_app/vegetables.dart';
import 'package:grocery_app/wallet.dart';
import 'package:grocery_app/wishlist.dart';
import 'address.dart';
import 'cart.dart';
import 'components.dart';
import 'customerService.dart';
import 'fruits.dart';
import 'myorders.dart';

final List<String> imgList = [
  'assets/images/carousel1.png',
  'assets/images/carousel2.png',
  'assets/images/carousel3.png',
  'assets/images/carousel4.png',
];
final List<String> imgList2 = [
  'assets/images/asap1.png',
  'assets/images/asap2.png',
];

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  double height, width;
  int _current = 0;
  List<bool> icons = [true, false, false, false];
  final CarouselController _controller = CarouselController();
  FocusNode currentFocus;

  @override
  void dispose() {
    if (currentFocus != null) currentFocus.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.cover),
                  ],
                ),
              ),
            ))
        .toList();

    return GestureDetector(
      onTap: () {
        currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        extendBody: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.125),
          child: AppBar(
            elevation: 0.0,
            automaticallyImplyLeading: false,
            flexibleSpace: Padding(
              padding: EdgeInsets.all(8.0),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: height * 0.005),
                  width: width,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Builder(
                            builder: (context) => GestureDetector(
                              child: Icon(Icons.menu,
                                  color: Colors.white, size: width * 0.085),
                              onTap: () => Scaffold.of(context).openDrawer(),
                            ),
                          ),
                        ),
                        Container(
                          width: width * 0.65,
                          child: Row(
                            children: [
                              Icon(FontAwesome.truck,
                                  size: 18, color: Colors.white),
                              AutoSizeText(
                                  ' 405, Silver Plaza, Citylight, Surat ',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white)),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AddressScreen()));
                                },
                                child: Image.asset(
                                    'assets/images/white pen.png',
                                    width: width * 0.05,
                                    height: width * 0.05),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/white ball.png',
                                width: width * 0.06, height: width * 0.06),
                            GestureDetector(
                                onTap: () {
                                  reset();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CartScreen(),
                                      ));
                                },
                                child: Image.asset(
                                    'assets/images/Group 6885 (2).png',
                                    width: width * 0.09,
                                    height: width * 0.09)),
                          ],
                        ),
                      ]),
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: height * 0.005),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: width * 0.85,
                            height: height * 0.05,
                            child: TextFormField(
                              keyboardType: TextInputType.none,
                              onTap: () {
                                currentFocus = FocusScope.of(context);

                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchScreen()),
                                );
                              },
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  child: CarouselSlider(
                    items: imageSliders,
                    carouselController: _controller,
                    options: CarouselOptions(
                        autoPlay: true,
                        height: height * 0.195,
                        autoPlayInterval: Duration(seconds: 10),
                        enlargeCenterPage: false,
                        aspectRatio: 2.0,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                ),
                Positioned(
                  left: width * 0.3,
                  right: width * 0.3,
                  top: height * 0.15,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 10.0,
                            height: 10.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _current == entry.key
                                    ? Colors.green
                                    : Colors.grey.shade400),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ]),
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  height: height * 0.116,
                ),
                items: imgList2
                    .map((item) => Image.asset(item, width: width))
                    .toList(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    width * 0.1, width * 0.1, width * 0.1, width * 0.05),
                child: AutoSizeText(
                  'SHOP BY CATEGORY',
                  style:
                      GoogleFonts.aclonica(fontSize: 24, color: Colors.green),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  GestureDetector(
                    onTap: () {
                      reset();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => (Vegetables()),
                          ));
                    },
                    child: Image.asset(
                      'assets/images/Group 6842.png',
                      height: width * 0.45,
                      width: width * 0.45,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      reset();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => (Fruits()),
                          ));
                    },
                    child: Image.asset(
                      'assets/images/Group 6841.png',
                      height: width * 0.45,
                      width: width * 0.45,
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  GestureDetector(
                    onTap: () {
                      reset();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => (Vegetables()),
                          ));
                    },
                    child: Image.asset(
                      'assets/images/Group 6843.png',
                      height: width * 0.45,
                      width: width * 0.45,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      reset();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => (Fruits()),
                          ));
                    },
                    child: Image.asset(
                      'assets/images/Group 6844.png',
                      height: width * 0.45,
                      width: width * 0.45,
                    ),
                  ),
                ]),
              ),
              Container(
                width: width,
                height: height * 0.8,
                child: Stack(children: [
                  Image.asset(
                    'assets/images/Group 6835.png',
                    width: width,
                    height: height * 0.8,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                  Positioned(
                    top: height * 0.2,
                    left: width * 0.05,
                    right: width * 0.05,
                    child: Container(
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SaleProduct(
                            img: 'assets/images/Group 6890.png',
                            op: '290',
                            dp: '250',
                            name: 'Green Apple',
                          ),
                          SaleProduct(
                            img: 'assets/images/group123.png',
                            op: '250',
                            dp: '120',
                            name: 'Lady Finger',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * 0.5,
                    left: width * 0.05,
                    right: width * 0.05,
                    child: Container(
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SaleProduct(
                            img: 'assets/images/Group 6890.png',
                            op: '290',
                            dp: '250',
                            name: 'Green Apple',
                          ),
                          SaleProduct(
                            img: 'assets/images/group123.png',
                            op: '250',
                            dp: '120',
                            name: 'Lady Finger',
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
        floatingActionButton: fAB(width),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Bottom(),
        drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  height: height * 0.3,
                  child: DrawerHeader(
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(children: [
                      Container(
                          height: height * 0.11,
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.025,
                              vertical: height * 0.01),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://wallpaperaccess.com/full/2213424.jpg'),
                                  radius: width * 0.075,
                                ),
                              ])),
                      Container(
                        height: height * 0.1,
                        width: width,
                        padding:
                            EdgeInsets.symmetric(horizontal: width * 0.0275),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText('Aviral Chaudhary',
                                  maxLines: 1, style: TextStyle(fontSize: 24)),
                              Container(
                                margin: EdgeInsets.only(top: height * 0.005),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                        '405, Silver Plaza, Citylight, Surat ',
                                        style:
                                            TextStyle(fontSize: width * 0.03)),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddressScreen()));
                                      },
                                      child: Icon(Icons.edit,
                                          color: Colors.green,
                                          size: width * 0.05),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: height * 0.005),
                                padding: EdgeInsets.only(right: width * 0.015),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                        'Earliest Delivery in 10 hrs.* ',
                                        style:
                                            TextStyle(fontSize: width * 0.03)),
                                    Image.asset('assets/images/Vecto.png',
                                        color: Colors.green,
                                        width: width * 0.03)
                                  ],
                                ),
                              ),
                            ]),
                      )
                    ]),
                  ),
                ),
                Container(
                  color: Colors.green,
                  height: 2,
                ),
                DrawerElement(
                    title: 'My Account',
                    mpr: MaterialPageRoute(
                        builder: (context) => ProfileScreen())),
                DrawerElement(
                    title: 'WishList',
                    mpr: MaterialPageRoute(builder: (context) => WishScreen())),
                DrawerElement(
                    title: 'My Cart',
                    mpr: MaterialPageRoute(builder: (context) => CartScreen())),
                DrawerElement(
                    title: 'My Wallet',
                    mpr: MaterialPageRoute(
                        builder: (context) => WalletScreen())),
                DrawerElement(
                    title: 'My Order',
                    mpr:
                        MaterialPageRoute(builder: (context) => OrderScreen())),
                Row(
                  children: [
                    DrawerElement(
                      title: 'Refer and Earn',
                    ),
                    SizedBox(width: width * 0.05),
                    Image.asset('assets/images/image 7.png',
                        width: width * 0.05)
                  ],
                ),
                DrawerElement(
                    title: 'Customer Service',
                    mpr: MaterialPageRoute(builder: (context) => CustomerScreen())),
                DrawerElement(title: 'FAQ'),
                DrawerElement(title: 'Farm Cookbook'),
                DrawerElement(title: 'Community'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
