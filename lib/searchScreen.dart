import 'package:flutter/material.dart';
import 'cart.dart';
import 'category.dart';
import 'components.dart';
import 'country_model.dart';


class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  double width, height;
  FocusScopeNode currentFocus;
  List<Country> countries = [];
  @override
  void dispose() {
    if(currentFocus!=null)
   currentFocus.unfocus();
    super.dispose();
  }
  List productList(String str) {
    var names = [];
    var names2 = [];
    names2 =
        countries.where((e) => e.name.toLowerCase().startsWith(str.toLowerCase())).toList();
    for (int i = 0; i < names2.length; i++) {
      names.add(names2[i].name);
      if (i > 4) break;
    }
    return names;
  }

  TextEditingController _textEditingController = new TextEditingController();
  List names;
  @override
  void initState() {
    super.initState();
    countries = data.map((e) => Country.fromMap(e)).toList();
    names = productList("a");
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
         currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
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
                                  onTap: (){

                                  },
                                  controller: _textEditingController,
                                  onChanged: (value) {
                                    names = productList(value.toString());
                                    setState(() {});
                                  },
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
                height: height * 0.3,
                child: ListView.builder(
                    itemCount: names.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SearchProduct(
                        name: names[index],
                        textField: _textEditingController,
                      );
                    }),
              ),
              Container(
                margin: EdgeInsets.only(top: height * 0.025),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        child: Text("Popular Categories",
                            style: TextStyle(fontSize: 20, color: Colors.grey)),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => CategoryScreen()));
                        },
                        child: SearchProduct(
                          name: "Fresh Apples",
                        ),
                      ),
                      SearchProduct(
                        name: "Exotic Fruits & Veggies",
                      ),
                      SearchProduct(
                        name: "Organic Apples and Vegetables",
                      ),
                      SearchProduct(
                        name: "Dry Apple",
                      ),
                    ]),
              ),
              Container(
                height:height*0.3,
                margin: EdgeInsets.only(top: height * 0.025),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        child: Text("Popular Search",
                            style: TextStyle(fontSize: 20, color: Colors.grey)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SearchCategories(
                                image: "assets/images/image 10.png",
                                title: "Cauliflower"
                            ),
                            SearchCategories(
                                image: "assets/images/emojione_red-apple.png",
                                title: "Apple"
                            ),
                            SearchCategories(
                                image: "assets/images/fxemoji_banana.png",
                                title: "Banana"
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SearchCategories(
                                image: "assets/images/image 11.png",
                                title: "Cabbage"
                            ),
                            SearchCategories(
                                image: "assets/images/emojione_potato.png",
                                title: "Potato"
                            ),
                            SearchCategories(
                                image: "assets/images/images-removebg-preview (1) 1.png",
                                title: "Lady Finger"
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SearchCategories(
                                image: "assets/images/emojione_tomato.png",
                                title: "Tomato"
                            ),
                            SearchCategories(
                                image: "assets/images/emojione-v1_ear-of-corn.png",
                                title: "Corn"
                            ),
                          ],
                        ),
                      ),

                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
