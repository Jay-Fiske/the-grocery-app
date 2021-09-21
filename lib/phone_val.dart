import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'otp.dart';

class PhoneVal extends StatefulWidget {
  final TextEditingController phone;

  const PhoneVal({Key key, @required this.phone}) : super(key: key);
  @override
  _PhoneValState createState() => _PhoneValState();
}

class _PhoneValState extends State<PhoneVal> {
  double height, width;

  bool isChecked = false, isChecked2 = false;
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 25,
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Text('Surat,Gujarat', style: TextStyle(fontSize: 18))
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: height * 0.05),
                child: Text(
                  'Getting Started',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'Create an account to continue!',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              Container(
                margin: EdgeInsets.only(top: height * 0.1),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Container(
                        width: width * 0.8,
                        child: TextFormField(maxLength: 10,controller: widget.phone,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(contentPadding: EdgeInsets.only(top:width*0.05),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(width*0.02),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/255px-Flag_of_India.svg.png'),
                              ),
                            ),
                            prefix: Text('+91  '),
                            counterText: '',
                          ),
                          validator: (value){

                          },
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: height / 20),
                          width: width * 0.8,
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Otp(),
                                  ));
                            },
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            padding:
                                EdgeInsets.symmetric(vertical: width * 0.04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'CONTINUE',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                SizedBox(
                                  width: width / 10,
                                ),
                                Image.asset('assets/images/ArrowUp3.png',
                                    width: width * 0.06, height: width * 0.06),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
