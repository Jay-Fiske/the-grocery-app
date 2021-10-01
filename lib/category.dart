
import 'package:flutter/material.dart';

import 'cart.dart';
import 'components.dart';



class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<bool> isClicked = [true, false, false];
  void reset() {
    isClicked[0] = false;
    isClicked[1] = false;
    isClicked[2] = false;
  }

  double width, height;


  TextEditingController _textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
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
                            child:  GestureDetector(
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
                                controller: _textEditingController,
                                decoration: InputDecoration(
                                  contentPadding:
                                  EdgeInsets.symmetric(vertical: height * 0.01),
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
                                    borderSide:
                                    BorderSide(color: Colors.white, width: 0.0),
                                  ),
                                ),
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
            Container(
                height: height * 0.075,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                        elevation:0,
                        onPressed: () {
                          reset();
                          isClicked[0] = true;
                          setState(() {});
                        },
                        child: Container(
                          child: Text("All",
                              style: TextStyle(
                                  color: isClicked[0] ? Colors.white : Colors.black,fontSize:width*0.05)),
                        ),
                        color: isClicked[0] ? Colors.green : Colors.white,
                      ),
                      MaterialButton(
                        elevation:0,
                        onPressed: () {
                          reset();
                          isClicked[1] = true;
                          setState(() {});
                        },
                        child: Container(
                          child: Text("Fruits",
                              style: TextStyle(
                                  color: isClicked[1] ? Colors.white : Colors.black,fontSize:width*0.05)),
                        ),
                        color: isClicked[1] ? Colors.green : Colors.white,
                      ),
                      MaterialButton(
                        elevation:0,
                        onPressed: () {
                          reset();
                          isClicked[2] = true;
                          setState(() {});
                        },
                        child: Text("Vegetables",
                            style: TextStyle(
                                color: isClicked[2] ? Colors.white : Colors.black,fontSize:width*0.05)),
                        color: isClicked[2] ? Colors.green : Colors.white,
                      ),
                    ])),
            Container(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryProduct(
                    img: 'assets/images/Group 6890.png',
                    op: '290',
                    dp: '250',
                    name: 'Green Apple',
                  ),
                  CategoryProduct(
                    img: 'assets/images/Group 6888.png',
                    op: '250',
                    dp: '120',
                    name: 'Red Apple',
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: height * 0.01),
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryProduct(
                    img: 'assets/images/Group 6890.png',
                    op: '290',
                    dp: '250',
                    name: 'Green Apple',
                  ),
                  CategoryProduct(
                    img: 'assets/images/Group 6888.png',
                    op: '250',
                    dp: '120',
                    name: 'Red Apple',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
