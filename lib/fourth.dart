import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/phone_val.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double height, width;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  addFormData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', _name.text);
    prefs.setString('phone', _phone.text);
    prefs.setString('email', _email.text);
  }
  getFormData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     _name.text = prefs.getString('name') ;
    _phone.text = prefs.getString('phone');
    _email.text = prefs.getString('email');
    setState(() {

    });

  }
  @override
  initState(){
    getFormData();
    super.initState();
  }

  bool isChecked = false, isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.fromLTRB(width * 0.1, height * 0.1, width * 0.1, 0.0),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Hi There,",
            style: TextStyle(
                fontSize: 32, color: Colors.green, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            "Please Register",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height * 0.005,
          ),
          AutoSizeText(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin imperdiet",
            style: TextStyle(fontSize: 18, letterSpacing: 1.0),
            maxLines: 3,
          ),
          SizedBox(
            height: height * 0.005,
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: height * 0.02),
              padding: EdgeInsets.all(10),
              height: height * 0.65,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        width: width * 0.15,
                        height: 10,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: TextFormField(
                                controller: _name,
                                decoration: InputDecoration(
                                    labelText: 'Name*',
                                    prefixIcon: Icon(Icons.account_circle,
                                        color: Colors.green)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: TextFormField(
                                controller: _phone,
                                decoration: InputDecoration(
                                    labelText: 'Phone Number*',
                                    prefixIcon:
                                        Icon(Icons.phone, color: Colors.green)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Phone Number';
                                  } else if (value.length != 10) {
                                    return 'Please enter a valid Phone Number';
                                  }
                                  const pattern = r'[7-9][0-9]{9}';
                                  final regExp = RegExp(pattern);

                                  if (!regExp.hasMatch(value)) {
                                    return 'Please enter a valid Phone Number';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: TextFormField(
                                controller: _email,
                                decoration: InputDecoration(
                                    labelText: 'Email*',
                                    prefixIcon: Icon(
                                      Icons.mail,
                                      color: Colors.green,
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter email address';
                                  }

                                  const pattern =
                                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                                  final regExp = RegExp(pattern);

                                  if (!regExp.hasMatch(value)) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  Checkbox(
                                    checkColor: Colors.green,
                                    activeColor: Colors.grey.shade100,
                                    onChanged: (bool value) {
                                      isChecked = value;
                                      setState(() {});
                                    },
                                    value: isChecked,
                                  ),
                                  Text('I agree to  '),
                                  Text(
                                    'Terms of Service',
                                    style: TextStyle(
                                        color: Colors.green,
                                        decoration: TextDecoration.underline),
                                  )
                                ],
                              ),
                            ),
                            Visibility(
                              child: Text(
                                'Please accept Terms of Service',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                              ),
                              visible: isChecked2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.all(15)),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.green),
                                        shape: MaterialStateProperty.all(
                                            CircleBorder())),
                                    onPressed: () {
                                      bool val = false;
                                      val = _formKey.currentState.validate();
                                      if (isChecked != true) {
                                        val = false;
                                        isChecked2 = true;
                                        setState(() {});
                                      } else {
                                        isChecked2 = false;
                                        setState(() {});
                                      }
                                      if (val) {
                                        addFormData();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => PhoneVal(phone: _phone,),
                                            ));
                                      }
                                      _formKey.currentState.save();
                                    },
                                    child: Image.asset('assets/images/ArrowUp3.png',width: width*0.05,height:width*0.05),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ]),
      ),
    ));
  }
}
