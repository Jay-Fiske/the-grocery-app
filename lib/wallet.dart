import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'components.dart';


class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  double width, height;
  @override
  void initState() {
    super.initState();
    reset();
    icons[1]=true;
  }
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(height * 0.175),
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
                  'My Wallet',
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: width*0.0625,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Positioned(
              top: height * 0.1,
              right: width * 0.15,
              left: width * 0.15,
              child: Container(
                width: width * 0.75,
                height: height * 0.09,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(width * 0.05),
                ),
                child: Material(
                  elevation: width * 0.0125,
                  borderRadius: BorderRadius.circular(width * 0.05),
                  child: Row(
                    children: [
                      Container(
                          padding: EdgeInsets.all(width*0.04),
                          width:width*0.2,
                          alignment: Alignment.center,
                          child: Image.asset('assets/images/Group.png')
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                Text('Wallet Summary',style:TextStyle(fontSize:width*0.045,fontWeight:FontWeight.w400)),
                                Text('Current Balance    \u20B90',style:TextStyle(fontSize:width*0.03,fontWeight:FontWeight.w400))
                              ]
                          )
                      )

                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
      body: SingleChildScrollView(
          child:Column(
              children:[
                Container(height:height*0.125),
                Container(width:width*0.3,
                  child: Image.asset('assets/images/image 36.png',),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical:height*0.05),
                  child: AutoSizeText('Your Wallet is Empty',style:TextStyle(fontSize:width*0.075,color: Colors.grey,fontWeight: FontWeight.w600)),
                ),

                Container(
                  height:height*0.4,
                  padding:EdgeInsets.symmetric(horizontal:width*0.03),

                  child: AutoSizeText('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
                      ' Nullam molestie ante quis suscipit bibendum. Ut finibus ac magna sed '
                      'posuere. Mauris orci neque, posuere eget urna quis, ultrices sollicitudin odio'
                      '. Nulla odio neque, egestas vel odio eu, interdum aliquam augue. Suspendisse '
                      'eget orci tortor. Fusce ut augue sagittis, elementum velit in, malesuada libero.'
                      ' Integer erat ex, congue vitae sagittis sit amet, cursus ut est.'

                      'Quisque viverra porta metus in posuere. In gravida mauris ante, nec sagittis '
                      'quam porttitor ut. Mauris sit amet enim eu augue eleifend interdum. Pellentesque '
                      'dignissim metus id dui tempus congue. Praesent vitae tortor porttitor, convallis '
                      'mauris ac, pulvinar enim. Phasellus neque massa, auctor et nibh eu, tincidunt pretium '
                      'tortor. Fusce enim tortor, vestibulum maximus dolor vulputate, gravida elementum eros.',textAlign: TextAlign.justify,style:TextStyle(color:Colors.grey.shade400,fontSize: width*0.02,)),

                ),


              ]
          )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: fAB(width),
      bottomNavigationBar: Bottom(),
    );
  }
}
