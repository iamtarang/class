import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../utils/routes.dart';

class OTPPage extends StatefulWidget {
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      double fontSize = MediaQuery.of(context).size.width * 0.05;

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "OTP",
            style: GoogleFonts.baskervville(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey, // Assign the form key
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 2.h,
                      horizontal: 0.h,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.email, color: Colors.black, size: 40),
                    title: Container(
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter an email address';
                          }
                          if (!isEmailValid(value!)) {
                            return 'Invalid email format';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: GoogleFonts.baskervville(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 1.h,
                      horizontal: 0.h,
                    ),
                  ),
            Align(
              alignment: Alignment.center,
                  child:ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                      }
                    },
                    style: TextButton.styleFrom(minimumSize: Size(150, 40),backgroundColor: Color(0xFF907ad6)),
                    child: Text('Send OTP'),
                  ),
            ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 1.h,
                      horizontal: 0.h,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person_2, color: Colors.black, size: 40),
                    title: Container(
                      child: TextFormField(
                        controller: usernameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Username",
                          hintStyle: GoogleFonts.baskervville(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          prefixText: 'T',
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child : ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                      style: TextButton.styleFrom(minimumSize: Size(60, 40),backgroundColor: Color(0xFF907ad6)),
                      child: Text("Next   ",style:GoogleFonts.notoSerif(textStyle:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 2.h,
                      horizontal: 10.h,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  bool isEmailValid(String email) {
    final pattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }
}
