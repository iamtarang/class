import 'package:classfindr/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import '../already_have_an_account_acheck.dart';
import '../utils/Forgotpwdbtnwidget.dart';
import '../utils/buildShowModalBottomSheet.dart';
import '../utils/routes.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();

  bool _obscureText = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText; // Toggle the value
    });
  }

  late TextEditingController passwordController = TextEditingController();

  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    passwordController = TextEditingController();
  }

  final topImage = "assets/main_top.png";

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      double fontSize = MediaQuery
          .of(context)
          .size
          .width * 0.05;
      return Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 430,
                  // height: MediaQuery.of(context).size.height,
                  child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Image.asset(
                            topImage,
                            width: 160,
                          ),
                        ),
                        Positioned(
                          top: 180,
                          right: 25,
                          child: Image.asset(
                            "assets/2.png",
                            width: 310,
                            height: 230,
                          ),
                        ),

                      ]
                  ),

                ),

                Column(
                    children: [
                      Container(
                        width: 330,
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Username",
                              labelStyle: GoogleFonts.baskervville(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: fontSize),
                              prefixIcon: Icon(
                                Icons.person, // Choose the icon you want
                                color: Color(0xFF6910a8),),
                              // Set the icon color
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF6910a8),
                                ),
                              ),

                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Color(0xFF6910a8),
                                  )
                              )

                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 1.h,
                          horizontal: 4.h,
                        ),
                      ),
                      Container(
                        width: 330,
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: _obscureText,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            labelText: "Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText ? Icons.visibility_off : Icons
                                    .visibility,
                              ),
                              onPressed: _toggle,
                            ),
                            labelStyle: GoogleFonts.baskervville(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: fontSize),
                            prefixIcon: Icon(
                              Icons.lock, // Choose the icon you want
                              color: Color(0xFF6910a8),),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xFF6910a8),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xFF6910a8),
                                )
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            } else if (!isPasswordValid(value)) {
                              return 'Password must be at least 8 characters long \n and contain at least one letter and one number';
                            }
                            return null; // Return null if the input is valid
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 1.h,
                          horizontal: 4.h,
                        ),
                      ),
                      Hero(
                        tag: "Login",
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamed(
                                  context, MyRoutes.homeRoute);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(140, 40),
                            backgroundColor: Color(0xFF907ad6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  40.0), // Adjust the radius as needed
                            ),),
                          child: Text("Login", style: GoogleFonts.baskervville(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: fontSize)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 0.h,
                          horizontal: 1.h,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              buildShowModalBottomSheet(context);
                            },
                            child: Text("Forget Password",
                              style: GoogleFonts.baskervville(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: fontSize),),

                          ),
                        ],

                      ),
                      AlreadyHaveAnAccountCheck(
                        press: ()
                        {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return RegisterPage(); // Your RegisterPage widget
                            },
                          );
                              },
                            ),
                          ]

    ),
                    ]
                ),
            ),
          ),
        );
    });
  }
}
bool isPasswordValid(String password) {
  // Define a regular expression pattern for password validation
  // Password must contain at least one letter, one number, and be at least 8 characters long.
  final RegExp passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{8,}$');

  // Use the RegExp's 'hasMatch' method to check if the password is valid
  return passwordRegex.hasMatch(password);
}