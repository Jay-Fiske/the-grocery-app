import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:grocery_app/third.dart';

class IntroScreen1 extends StatefulWidget {
  @override
  _IntroScreen1State createState() => _IntroScreen1State();
}

class _IntroScreen1State extends State<IntroScreen1> {
  double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: width * 0.05, right: width * 0.15),
              margin: EdgeInsets.only(top: height * 0.1),
              width: width * 0.8,
              child: AutoSizeText(
                'Shopping for your fruit needs',
                maxLines: 3,
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
              margin: EdgeInsets.only(top: height * 0.03),
              child: AutoSizeText(
                'Mauris imperdiet scelerisque lacus sit amet efficitur.'
                ' Duis scelerisque lacus ac neque accumsan, nec sagittis '
                'tellus consectetur. Phasellus sed augue gravida, imperdiet ',
                maxLines: 7,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: height * 0.15),
              width: width,
              height: height * 0.3,
              child: Image.asset(
                'assets/images/back1.png',
                height: 100,
                width: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class IntroScreen2 extends StatefulWidget {
  @override
  _IntroScreen2State createState() => _IntroScreen2State();
}

class _IntroScreen2State extends State<IntroScreen2> {
  double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: width * 0.05, right: width * 0.15),
                  margin: EdgeInsets.only(top: height * 0.1),
                  width: width * 0.9,
                  child: AutoSizeText(
                    'Fresh vegetable will fulfill your life\'s need',
                    maxLines: 3,
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                  margin: EdgeInsets.only(top: height * 0.03),
                  child: AutoSizeText(
                    'Aenean pharetra tincidunt magna, nec dapibus est '
                    'scelerisque at. Vestibulum a velit nec enim mattis'
                    'et netus et malesuada fames ac turpis egestas. In ac nulla neque.'
                    ' Mauris in pulvinar urna.',
                    maxLines: 6,
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/images/back2.png',
              width: width,
            ),
          ),
        ]));
  }
}

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController controller = PageController();
  List<Widget> _list = <Widget>[IntroScreen1(), IntroScreen2()];
  int _curr = 0;

  double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: PageView(
        children: _list,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        controller: controller,
        onPageChanged: (num) {
          setState(() {
            _curr = num;
          });
        },
      ),
      floatingActionButton: Stack(children: [
        Positioned(
          left: 50,
          top: height * 0.55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.circle,
                size: (_curr == 0) ? 20 : 15,
                color: (_curr == 0) ? Colors.green : Colors.grey,
              ),
              SizedBox(
                width: width * 0.01,
              ),
              Icon(Icons.circle,
                  size: (_curr == 1) ? 20 : 15,
                  color: (_curr == 1) ? Colors.brown : Colors.grey),
            ],
          ),
        ),
        Positioned(
          right: width * 0.05,
          bottom: height * 0.2,
          child: ElevatedButton(
            onPressed: () {
              if(_curr!=1)
              controller.jumpToPage(_curr+1);
              else{
                Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen(),));
              }},
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(5),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shadowColor: MaterialStateProperty.all((_curr==0)?Colors.green:Colors.brown),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                side: MaterialStateProperty.all(
                    BorderSide(color: (_curr==0)?Colors.green:Colors.brown, width: 2))),
            child: AutoSizeText(
              'Skip',
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
          ),
        )
      ]),
    );
  }
}
