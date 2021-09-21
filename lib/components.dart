import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dashBoard.dart';
import 'profile.dart';
enum BestTutorSite { small, medium, large,xLarge}
BestTutorSite _site = BestTutorSite.small;
List<bool> icons = [true, false, false, false];
List<String> variation = ['2 pieces(Approx. 540 gm)','4 pieces(Approx. 1 kg)','6 pieces(Approx. 1.5 kg)','8 pieces(Approx. 2 kg)'];

void reset() {
  for (int i = 0; i < 4; i++) {
    icons[i] = false;
  }
}
class SaleProduct extends StatefulWidget {
   final String op,dp,img,name;

   const SaleProduct( {Key key,@required this.op,@required this.dp,@required this.img,@required this.name,}) : super(key: key);
  @override
  _SaleProductState createState() => _SaleProductState();
}

class _SaleProductState extends State<SaleProduct> {
  double height,width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return new Material(
      color: Colors.white,
      elevation: 10,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: width * 0.5,
        width: width * 0.35,
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
            width: width * 0.25,
            height: width * 0.15,
            child: Image.asset(
              widget.img,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: Row(
              children: [
                Container(
                  width: width * 0.2,
                  child: AutoSizeText(
                    widget.name,
                    style: TextStyle(fontSize: 15),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  width: width * 0.11,
                  child: Image.asset('assets/images/image 32.png'),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap:(){ showDialog(
              context: context,
              builder: (BuildContext context) => DialogBox(),
            );
            },
            child: new Container(
              padding: EdgeInsets.all(3),
              height: height * 0.03,
              width: width * 0.32,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  Container(
                    width:width*0.25,
                    child: AutoSizeText(
                      variation[1],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Image.asset('assets/images/Vecto.png',width:width*0.03,height:height*0.03)
                ],
              ),),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
            child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(children: [
                AutoSizeText(
                  '\u{20B9}'+widget.op,
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 15,
                      color: Colors.grey),
                ),
                AutoSizeText(
                  '\u{20B9}'+widget.dp,
                  style: TextStyle(fontSize: 18),
                )
              ]),
              Image.asset('assets/images/Group 6814.png',
                  width: width * 0.08, height: width * 0.08)
            ]),
          )
        ]),
      ),
    );
  }
}

class CategoryAppBar extends StatefulWidget {
 final String backgroundImage,productImage,name;

  const CategoryAppBar( {Key key, this.backgroundImage, this.productImage, this.name}) : super(key: key);
  @override
  _CategoryAppBarState createState() => _CategoryAppBarState();
}

class _CategoryAppBarState extends State<CategoryAppBar> {
  double height,width;
  @override
  Widget build(BuildContext context) {
     height = MediaQuery.of(context).size.height;
     width = MediaQuery.of(context).size.width;
    return PreferredSize(
      preferredSize: Size.fromHeight(height * 0.225),
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
                widget.backgroundImage,
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
                widget.name,
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
            child: Container(
              padding: EdgeInsets.all(width * 0.03),
              height: width * 0.275,
              width: width * 0.275,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
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
                  child: Image.asset(widget.backgroundImage, fit: BoxFit.cover)),
            ),
          )
        ]),
      ),
    );
  }
}



PreferredSize customAppBar(
    double height, double width, String img1, String img2, String name) {
  return PreferredSize(
    preferredSize: Size.fromHeight(height * 0.225),
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
              img1,
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
              name,
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
          child: Container(
            padding: EdgeInsets.all(width * 0.03),
            height: width * 0.275,
            width: width * 0.275,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
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
                child: Image.asset(img2, fit: BoxFit.cover)),
          ),
        )
      ]),
    ),
  );
}

class Bottom extends StatefulWidget {

  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  double height,width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return BottomAppBar(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(width * 0.075),
                topRight: Radius.circular(width * 0.075))),
        height: height * 0.075,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  if(icons[0]!=true) {
                    reset();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashBoard(),
                        ));
                    icons[0] = true;
                    setState(() {});
                  }
                },
                child: Image.asset(
                    icons[0]
                        ? 'assets/images/home (1) 1.png'
                        : 'assets/images/home 1.png',
                    width: width * 0.1,
                    height: width * 0.1),
              ),
              GestureDetector(
                onTap: () {
                  reset();
                  icons[1] = true;
                  setState(() {});
                },
                child: Image.asset(
                    icons[1]
                        ? 'assets/images/wallet (1) 1.png'
                        : 'assets/images/wallet 1.png',
                    width: width * 0.1,
                    height: width * 0.1),
              ),
              SizedBox.shrink(),
              GestureDetector(
                onTap: () {
                  reset();
                  icons[2] = true;
                  setState(() {});
                },
                child: Image.asset(
                    icons[2]
                        ? 'assets/images/like (1) 2.png'
                        : 'assets/images/like 1.png',
                    width: width * 0.1,
                    height: width * 0.1),
              ),
              GestureDetector(
                onTap: () {
                  reset();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ));
                  icons[3] = true;
                  setState(() {});
                },
                child: Image.asset(
                    icons[3]
                        ? 'assets/images/user 0.png'
                        : 'assets/images/user 1.png',
                    width: width * 0.1,
                    height: width * 0.1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

FloatingActionButton fAB(double width) {
  return FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.mic, size: width * 0.1),
    shape: CircleBorder(side: BorderSide(color: Colors.white, width: 3.0)),
  );
}

SizedBox categoryList(double width, List<String> list) {
  return SizedBox(
    height: width * 0.3,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return (Container(
            width: width * 0.3,
            height: width * 0.3,
            margin: EdgeInsets.symmetric(horizontal: width * 0.015),
            padding: EdgeInsets.all(7.0),
            child: Image.asset(
              list[index],
            )));
      },
    ),
  );
}

Divider customDivider() {
  return Divider(
    color: Colors.grey,
    thickness: 1.0,
  );
}

Padding categoryName(double width, String title) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: width * 0.02),
    child: Center(
        child: AutoSizeText(
      title,
      style: GoogleFonts.merriweather(fontSize: 24, color: Color(0xff1f631f)),
    )),
  );
}
class DialogBox extends StatefulWidget {

  @override
  _DialogBoxState createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title:  Text('Quantity',style:TextStyle(fontSize:24)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),side:BorderSide(color: Colors.green,width:2)),
      content: RadioList(),actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        // ignore: deprecated_member_use
        FlatButton(color: Colors.green,shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15)),
          onPressed: () {
            Navigator.of(context).pop();
            },
          child:  Text('Confirm',style:TextStyle(fontSize: 20,color:Colors.white)),
        ),
      ],
    );
  }
}

class RadioList extends StatefulWidget {

  @override
  _RadioListState createState() => _RadioListState();
}

class _RadioListState extends State<RadioList> {

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          title:  AutoSizeText(variation[0],maxLines: 1,overflow:TextOverflow.ellipsis),
          leading: Radio(
            value: BestTutorSite.small,
            groupValue: _site,
            onChanged: (BestTutorSite value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        ListTile(
          title:  AutoSizeText(variation[1],maxLines: 1,),
          leading: Radio(
            value: BestTutorSite.medium,
            groupValue: _site,
            onChanged: (BestTutorSite value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        ListTile(
          title:  AutoSizeText(variation[2],maxLines: 1,),
          leading: Radio(
            value: BestTutorSite.large,
            groupValue: _site,
            onChanged: (BestTutorSite value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        ListTile(
          title:  AutoSizeText(variation[3],maxLines: 1,),
          leading: Radio(
            value: BestTutorSite.xLarge,
            groupValue: _site,
            onChanged: (BestTutorSite value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),


      ],
    );
  }
}
Padding rowElement(double height,double width,String img,String name){
  return Padding(
    padding: EdgeInsets.all(10.0),
    child: Row(
        children:[
          Image.asset(img,width:width*0.05),
          SizedBox(width:width*0.01),
          Text(name,style:(TextStyle(fontSize:20,color:Colors.grey.shade700)))
        ]
    ),
  );
}
Container customDivider2(double height,double width){
  return  Container(
      height: height * 0.00125,
      width: width,
      color: Colors.grey);
}
