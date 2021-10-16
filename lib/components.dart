import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/wallet.dart';
import 'package:grocery_app/wishlist.dart';
import 'product.dart';

import 'category.dart';
import 'dashBoard.dart';
import 'profile.dart';

enum BestTutorSite { small, medium, large, xLarge }
BestTutorSite _site = BestTutorSite.small;
List<bool> icons = [true, false, false, false];
List<String> variation = [
  '2 pieces(Approx. 540 gm)',
  '4 pieces(Approx. 1 kg)',
  '6 pieces(Approx. 1.5 kg)',
  '8 pieces(Approx. 2 kg)'
];

void reset() {
  for (int i = 0; i < 4; i++) {
    icons[i] = false;
  }
}

class SearchCategories extends StatefulWidget {
  final String image, title;

  const SearchCategories({Key key, @required this.image, @required this.title})
      : super(key: key);

  @override
  _SearchCategoriesState createState() => _SearchCategoriesState();
}

class _SearchCategoriesState extends State<SearchCategories> {
  double width, height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.001),
      height: height * 0.03,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(width * 0.01)),
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(widget.image, width: width * 0.05),
        AutoSizeText(widget.title),
      ]),
    );
  }
}

class SearchProduct extends StatefulWidget {
  final String name;
  final TextEditingController textField;

  const SearchProduct({Key key, @required this.name, this.textField})
      : super(key: key);
  @override
  _SearchProductState createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height * 0.05,
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoryScreen()),
              );
            },
            child: Text(widget.name)),
        GestureDetector(
            onTap: () {
              if (widget.textField != null) {
                widget.textField.text = widget.name;
                widget.textField.selection = TextSelection.fromPosition(
                    TextPosition(offset: widget.textField.text.length));
                setState(() {});
              }
            },
            child: Image.asset("assets/images/akar-icons_arrow-down-left.png",
                width: width * 0.05))
      ]),
    );
  }
}

class SaleProduct extends StatefulWidget {
  final String op, dp, img, name;

  const SaleProduct({
    Key key,
    @required this.op,
    @required this.dp,
    @required this.img,
    @required this.name,
  }) : super(key: key);
  @override
  _SaleProductState createState() => _SaleProductState();
}

class _SaleProductState extends State<SaleProduct> {
  double height, width;
  String data = '4 pieces(Approx. 1 kg)';
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Material(
      color: Colors.white,
      elevation: 10,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: height * 0.275,
        width: width * 0.35,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            margin: EdgeInsets.only(top: height * 0.02),
            height: width * 0.2,
            child: Image.asset(
              widget.img,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.05),
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
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.02, vertical: height * 0.01),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    AutoSizeText(
                      '\u{20B9}' + widget.dp,
                      style: TextStyle(fontSize: 18),
                    ),
                    AutoSizeText(
                      '\u{20B9}' + widget.op,
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                  ]),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductScreen()));
                    },
                    child: Image.asset('assets/images/Group 6814.png',
                        width: width * 0.08, height: width * 0.08),
                  )
                ]),
          )
        ]),
      ),
    );
  }
}

class CategoryProduct extends StatefulWidget {
  final String op, dp, img, name;

  const CategoryProduct({
    Key key,
    @required this.op,
    @required this.dp,
    @required this.img,
    @required this.name,
  }) : super(key: key);
  @override
  _CategoryProductState createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  double height, width;
  String data = '4 pieces(Approx. 1 kg)';
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Material(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(width: 0.35)),
      child: Container(
        height: height * 0.3,
        width: width * 0.45,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.04, vertical: height * 0.01),
            height: height * 0.175,
            child: Image.asset(
              widget.img,
              fit: BoxFit.scaleDown,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: Row(
              children: [
                Container(
                  width: width * 0.3,
                  child: AutoSizeText(
                    widget.name,
                    style: TextStyle(fontSize: width * 0.05),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: width * 0.02, vertical: 6),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 0.175,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            '\u{20B9}' + widget.dp,
                            maxLines: 1,
                            style: TextStyle(fontSize: width * 0.0625),
                          ),
                          AutoSizeText(
                            '\u{20B9}' + widget.op,
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: width * 0.035,
                                color: Colors.grey),
                          ),
                        ]),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductScreen()));
                    },
                    child: Image.asset(
                      'assets/images/Group 6814.png',
                      width: width * 0.1,
                    ),
                  )
                ]),
          )
        ]),
      ),
    );
  }
}

class CategoryAppBar extends StatefulWidget {
  final String backgroundImage, productImage, name;

  const CategoryAppBar(
      {Key key, this.backgroundImage, this.productImage, this.name})
      : super(key: key);
  @override
  _CategoryAppBarState createState() => _CategoryAppBarState();
}

class _CategoryAppBarState extends State<CategoryAppBar> {
  double height, width;
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
                  child:
                      Image.asset(widget.backgroundImage, fit: BoxFit.cover)),
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
  double height, width;

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
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.075, vertical: height * 0.0175),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  if (icons[0] == false) {
                    reset();
                    icons[0] = true;

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashBoard(),
                        ));
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

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WalletScreen(),
                      ));
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
                  if(icons[2]==false) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WishScreen(),
                        ));
                    setState(() {});
                  }
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
                  if (icons[3] == false) {

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(),
                        ));
                    icons[3] = true;
                    setState(() {});
                  }
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
    child: Icon(Icons.mic, size: width * 0.09),
    shape: CircleBorder(side: BorderSide(color: Colors.white, width: 2.0)),
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
      title: Text('Quantity', style: TextStyle(fontSize: 24)),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.green, width: 2)),
      content: RadioList(),
      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        // ignore: deprecated_member_use
        FlatButton(
          color: Colors.green,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: () {
            Navigator.pop(context, variation[_site.index]);
          },
          child: Text('Confirm',
              style: TextStyle(fontSize: 20, color: Colors.white)),
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
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            title: AutoSizeText(variation[0],
                maxLines: 1, overflow: TextOverflow.ellipsis),
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
            title: AutoSizeText(
              variation[1],
              maxLines: 1,
            ),
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
            title: AutoSizeText(
              variation[2],
              maxLines: 1,
            ),
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
            title: AutoSizeText(
              variation[3],
              maxLines: 1,
            ),
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
      ),
    );
  }
}

Padding rowElement(double height, double width, String img, String name) {
  return Padding(
    padding: EdgeInsets.all(10.0),
    child: Row(children: [
      Image.asset(img, width: width * 0.04),
      SizedBox(width: width * 0.01),
      Text(name,
          style:
              (TextStyle(fontSize: width * 0.035, color: Colors.grey.shade700)))
    ]),
  );
}

Container customDivider2(double height, double width) {
  return Container(height: height * 0.00125, width: width, color: Colors.grey);
}

class CartProduct extends StatefulWidget {
  final String title, image, dp, op;
  final TextEditingController txt;

  const CartProduct(
      {Key key, this.title, this.image, this.dp, this.op, this.txt})
      : super(key: key);
  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  double height, width;
  String dropDownData = variation[1];
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(vertical: height * 0.015),
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width * 0.05)),
        elevation: 2,
        child: Container(
          height: height * 0.15,
          width: width * 0.9,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              width: width * 0.36,
              height: height * 0.15,
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: height * 0.015),
              child: Column(
                children: [
                  Image.asset(
                    widget.image,
                    height: height * 0.07,
                    width: width * 0.25,
                  ),
                  Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                        GestureDetector(
                          onTap: () {
                            if (int.parse(widget.txt.text) > 0)
                              widget.txt.text =
                                  (int.parse(widget.txt.text) - 1).toString();
                          },
                          child: Image.asset(
                              'assets/images/akar-icons_circle-minus-fill.png',
                              width: width * 0.05),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(width * 0.01),
                                border: Border.all(width: 0.5)),
                            width: width * 0.075,
                            height: width * 0.075,
                            alignment: Alignment.centerRight,
                            child: TextField(
                              textAlign: TextAlign.center,
                              showCursor: false,
                              onEditingComplete: () {
                                if (widget.txt.text.length == 0) {
                                  widget.txt.text = "0";
                                  setState(() {});
                                }
                                FocusScope.of(context).unfocus();
                              },
                              onTap: () {
                                if (widget.txt.text == '0') {
                                  widget.txt.text = "";
                                  setState(() {});
                                }
                              },
                              controller: widget.txt,
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
                                  borderSide: BorderSide(width: 0),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(width: 0),
                                ),
                              ),
                            )),
                        GestureDetector(
                          onTap: () {
                            widget.txt.text =
                                (int.parse(widget.txt.text) + 1).toString();
                          },
                          child: Image.asset('assets/images/Group 6814.png',
                              width: width * 0.05),
                        )
                      ]))
                ],
              ),
            ),
            Container(
              width: width * 0.54,
              height: height * 0.15,
              padding: EdgeInsets.all(width * 0.03),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(widget.title,
                        maxLines: 1, style: TextStyle(fontSize: width * 0.06)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height * 0.005),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.005),
                              width: width * 0.15,
                              child: AutoSizeText('\u20B9' + widget.dp,
                                  style: TextStyle(fontSize: width * 0.05)),
                            ),
                            Container(
                              width: width * 0.15,
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.005),
                              child: AutoSizeText('\u20B9' + widget.op,
                                  style: TextStyle(
                                      fontSize: width * 0.045,
                                      color: Colors.grey.shade600,
                                      decoration: TextDecoration.lineThrough)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.1),
                              child: Image.asset('assets/images/bin 1.png',
                                  width: width * 0.05),
                            )
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.008),
                      child: GestureDetector(
                        onTap: () async {
                          dropDownData = await showDialog(
                            context: context,
                            builder: (BuildContext context) => DialogBox(),
                          );
                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.all(3),
                          height: height * 0.03,
                          width: width * 0.45,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              Container(
                                width: width * 0.375,
                                child: AutoSizeText(
                                  dropDownData,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Image.asset('assets/images/Vecto.png',
                                  width: width * 0.03)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
            )
          ]),
        ),
      ),
    );
  }
}

class WishListProduct extends StatefulWidget {
  final String op, dp, img, name;

  const WishListProduct({
    Key key,
    @required this.op,
    @required this.dp,
    @required this.img,
    @required this.name,
  }) : super(key: key);
  @override
  _WishListProductState createState() => _WishListProductState();
}

class _WishListProductState extends State<WishListProduct> {
  double height, width;
  String data = '4 pieces(Approx. 1 kg)';
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(
          vertical: height * 0.01, horizontal: width * 0.01),
      child: Material(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(width: 0.35)),
        child: Container(
          height: height * 0.3,
          width: width * 0.45,
          child: Stack(
            children: [
              Column(children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04, vertical: height * 0.01),
                  height: height * 0.15,
                  child: Image.asset(
                    widget.img,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  child: Row(
                    children: [
                      Container(
                        width: width * 0.3,
                        child: AutoSizeText(
                          widget.name,
                          style: TextStyle(fontSize: width * 0.05),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width * 0.175,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  '\u{20B9}' + widget.dp,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: width * 0.0625),
                                ),
                                AutoSizeText(
                                  '\u{20B9}' + widget.op,
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: width * 0.035,
                                      color: Colors.grey),
                                ),
                              ]),
                        ),
                      ]),
                ),
              ]),
              Positioned(
                  bottom: 0,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                      ),
                      height: height * 0.04,
                      width: width * 0.45,
                      alignment: Alignment.center,
                      child: Text('Move to Cart',
                          style: TextStyle(
                              color: Colors.white, fontSize: width * 0.05))))
            ],
          ),
        ),
      ),
    );
  }
}

Container notification(String icon, String title, String description,
    String time, String date, double height, double width) {
  return Container(
    height: height * 0.11,
    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
    child: Column(
      children: [
        Row(children: [
          Container(
              margin: EdgeInsets.only(right: width * 0.035),
              child: Image.asset(icon, width: width * 0.03)),
          Container(
            width: width * 0.7,
            child: Text(title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: width * 0.05)),
          ),
        ]),
        Container(
          margin: EdgeInsets.only(left: width * 0.06, top: height * 0.01),
          child: Text(
            description,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: width * 0.04, color: Colors.grey),
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  date,
                  style: TextStyle(
                      fontSize: width * 0.03, color: Colors.grey.shade400),
                ),
                SizedBox(width: width * 0.01),
                Text(
                  time,
                  style: TextStyle(
                      fontSize: width * 0.03, color: Colors.grey.shade400),
                ),
              ],
            )),
      ],
    ),
  );
}

Container myOrder(double height, double width, String name, String item1,
    String item2, String price, String date) {
  return Container(
    height: height * 0.225,
    width: width,
    margin: EdgeInsets.only(top: height * 0.02),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade600),
        borderRadius: BorderRadius.circular(width * 0.02)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height * 0.06,
          width: width,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                bottom: width * 0.01,
                child: Container(
                    alignment: Alignment.bottomCenter,
                    height: width * 0.175,
                    width: width * 0.125,
                    child: Image.asset(
                      'assets/images/shopping-bag.png',
                      fit: BoxFit.contain,
                      height: width * 0.075,
                      width: width * 0.075,
                    )),
              ),
              Positioned(
                bottom: width * 0.02,
                left: width * 0.15,
                child: Text(name, style: TextStyle(fontSize: width * 0.05)),
              ),
              Positioned(
                bottom: width * 0.02,
                right: width * 0.03,
                child: Padding(
                  padding: EdgeInsets.only(top: height * 0.02),
                  child: Text('\u{20B9}' + price,
                      style: TextStyle(fontSize: width * 0.05)),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: width * 0.15, bottom: height * 0.01),
          child: Text(
            'Order In Processing',
            style: TextStyle(color: Colors.green, fontSize: width * 0.04),
          ),
        ),
        Container(
          height: height * 0.055,
          width: width,
          margin: EdgeInsets.only(left: width * 0.15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            AutoSizeText(
              item1,
              style: TextStyle(fontSize: width * 0.04, color: Colors.grey),
            ),
            AutoSizeText(
              item2,
              style: TextStyle(fontSize: width * 0.04, color: Colors.grey),
            )
          ]),
        ),
        Container(
            margin: EdgeInsets.only(left: width * 0.15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Delivery on',
                        style: TextStyle(fontSize: width * 0.025)),
                    Text(date, style: TextStyle(fontSize: width * 0.025))
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(
                        right: width * 0.03, bottom: height * 0.01),
                    height: height * 0.045,
                    width: width * 0.25,
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.green,
                      child: Text(
                        'Reorder',
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(width * 0.01)),
                    ))
              ],
            )),
      ],
    ),
  );
}

class MyReview extends StatefulWidget {
  final String title, price, days, img;
  const MyReview(
      {Key key,
      @required this.title,
      @required this.price,
      @required this.days,
      @required this.img})
      : super(key: key);
  @override
  _MyReviewState createState() => _MyReviewState();
}

class _MyReviewState extends State<MyReview> {
  double height, width;
  List<bool> star = [true, true, true, false, false];
  rating(int i) {
    for (int j = 0; j <= i; j++) {
      star[j] = true;
    }
    for (int k = i + 1; k <= 4; k++) {
      star[k] = false;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height * 0.18,
      margin: EdgeInsets.symmetric(vertical: height * 0.01),
      padding: EdgeInsets.symmetric(
          vertical: height * 0.005, horizontal: width * 0.02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.025),
          border: Border.all(color: Colors.grey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: width * 0.14,
                    height: width * 0.14,
                    alignment: Alignment.center,
                    child: Image.asset(widget.img)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                        style: TextStyle(fontSize: width * 0.05)),
                    AutoSizeText('2 pcs - (Approx. 200 to 250 gm)',
                        style: TextStyle(fontSize: width * 0.04))
                  ],
                ),
                Text('\u{20B9}' + widget.price,
                    style: TextStyle(fontSize: width * 0.04))
              ]),
          Padding(
            padding: EdgeInsets.all(width * 0.03),
            child: Text(
              'Last bought to you - ' + widget.days + ' Days ago',
              style: TextStyle(fontSize: width * 0.0325, color: Colors.grey),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: height * 0.025,
            width: width * 0.4,
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.025, vertical: height * 0.01),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: Icon(
                      star[0] ? Icons.star : Icons.star_border,
                      color: Colors.yellow,
                      size: 25,
                    ),
                    onTap: () {
                      rating(0);
                    },
                  ),
                  InkWell(
                      child: Icon(star[1] ? Icons.star : Icons.star_border,
                          color: Colors.yellow, size: 25),
                      onTap: () {
                        rating(1);
                      }),
                  InkWell(
                      child: Icon(star[2] ? Icons.star : Icons.star_border,
                          color: Colors.yellow, size: 25),
                      onTap: () {
                        rating(2);
                      }),
                  InkWell(
                      child: Icon(star[3] ? Icons.star : Icons.star_border,
                          color: Colors.yellow, size: 25),
                      onTap: () {
                        rating(3);
                      }),
                  InkWell(
                      child: Icon(star[4] ? Icons.star : Icons.star_border,
                          color: Colors.yellow, size: 25),
                      onTap: () {
                        rating(4);
                      }),
                ]),
          )
        ],
      ),
    );
  }
}

class MyReview2 extends StatefulWidget {
  final String title, price, days, img, rating, weight, description;
  const MyReview2({
    Key key,
    @required this.title,
    @required this.price,
    @required this.days,
    @required this.img,
    @required this.rating,
    @required this.weight,
    @required this.description,
  }) : super(key: key);
  @override
  _MyReview2State createState() => _MyReview2State();
}

class _MyReview2State extends State<MyReview2> {
  double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height * 0.175,
      margin: EdgeInsets.symmetric(vertical: height * 0.01),
      padding: EdgeInsets.symmetric(
          vertical: height * 0.005, horizontal: width * 0.02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.025),
          border: Border.all(color: Colors.grey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: width * 0.2,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: width * 0.14,
                    height: width * 0.2,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                              width: width * 0.14,
                              height: width * 0.14,
                              child: Image.asset(widget.img)),
                          Container(
                            width: width * 0.1,
                            height: width * 0.05,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(width * 0.02),
                                color: Colors.grey.shade200),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.yellow, size: width * 0.04),
                                  Text(widget.rating,
                                      style: TextStyle(fontSize: width * 0.03))
                                ]),
                          )
                        ]),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            width: width * 0.5,
                            child: AutoSizeText(
                                widget.title + " " + widget.weight,
                                maxLines: 1,
                                style: TextStyle(fontSize: width * 0.05))),
                        AutoSizeText(widget.description,
                            style: TextStyle(
                                fontSize: width * 0.04, color: Colors.green))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.014),
                    child: Text('\u{20B9}' + widget.price,
                        style: TextStyle(fontSize: width * 0.04)),
                  )
                ]),
          ),
          Padding(
            padding: EdgeInsets.all(width * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Modified - ' + widget.days + ' Days ago',
                  style:
                      TextStyle(fontSize: width * 0.0325, color: Colors.grey),
                ),
                Container(
                    height: width * 0.05,
                    width: width * 0.1,
                    child: MaterialButton(
                      padding: EdgeInsets.zero,
                      child: Text('Edit',
                          style: TextStyle(
                              fontSize: width * 0.035, color: Colors.grey)),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(width * 0.01),
                          side: BorderSide(color: Colors.green)),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerElement extends StatelessWidget {
  final String title;
  final MaterialPageRoute mpr;

  const DrawerElement({Key key, @required this.title, this.mpr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        if (mpr != null) {
          Navigator.pushReplacement(context, mpr);
        }
      },
      child: Container(
          height: height * 0.0625,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(
              vertical: height * 0.01, horizontal: width * 0.05),
          child: Text(title, style: TextStyle(fontSize: width * 0.04))),
    );
  }
}
