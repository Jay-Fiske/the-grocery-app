import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'components.dart';


class WishScreen extends StatefulWidget {
  @override
  _WishScreenState createState() => _WishScreenState();
}

class _WishScreenState extends State<WishScreen> {
  double width, height;
  @override
  void initState() {
    super.initState();
    reset();
    icons[2] = true;
  }
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;

      return Scaffold(
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(height * 0.075),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Container(height:height*0.03),
                Container(
                  padding:EdgeInsets.symmetric(horizontal: width*0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      Container(
                        child: AutoSizeText(
                          'Wishlist',
                          maxLines: 1,
                          style: TextStyle(
                              fontSize:width*0.075,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Image.asset('assets/images/Group 6901.png',width: width*0.1,)
                    ],
                  ),
                ),

              ]),
        ),
      ),
      body: SingleChildScrollView(
          child:Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
                children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      WishListProduct(
                        img: 'assets/images/Group 6890.png',
                        op: '290',
                        dp: '250',
                        name: 'Green Apple',
                      ),
                      WishListProduct(
                        img: 'assets/images/Group 6888.png',
                        op: '250',
                        dp: '120',
                        name: 'Red Apple',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      WishListProduct(
                        img: 'assets/images/Group 6890.png',
                        op: '290',
                        dp: '250',
                        name: 'Green Apple',
                      ),
                      WishListProduct(
                        img: 'assets/images/Group 6888.png',
                        op: '250',
                        dp: '120',
                        name: 'Red Apple',
                      ),
                    ],
                  ),

                ]
            ),
          )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: fAB(width),
      bottomNavigationBar: Bottom(),
    );
  }
}
