import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:classfindr/utils/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OTPPage2 extends StatefulWidget {
  _OTPPage2State createState() => _OTPPage2State();
}

class _OTPPage2State extends State<OTPPage2> {
  final back = "assets/otp.png";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  late String username;

  getUsername(Username) {
    this.username = Username;
  }

  bool isUsernameAlreadyTaken = false;

  createUsername() async {
    final username = usernameController.text;
    final usernameExists = await isUsernameTaken(username);

    setState(() {
      isUsernameAlreadyTaken = usernameExists;
    });

    if (!usernameExists) {
      // Username is unique, create it in Firestore
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection("StudentUsername")
          .doc(username);

      Map<String, dynamic> students = {
        "StudentUsername": username,
      };

      await documentReference.set(students);
      print("$username created");

      Navigator.pushNamed(context, MyRoutes.homeRoute);
    }
  }

  Future<bool> isUsernameTaken(String username) async {
    final snapshot = await FirebaseFirestore.instance
        .collection("StudentUsername")
        .doc(username)
        .get();

    return snapshot.exists;
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      double fontSize = MediaQuery.of(context).size.width * 0.05;

      return Scaffold(

        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey, // Assign the form key
              child: Column(
                children: <Widget>[
                  Positioned(
                    top: 400,
                    left: 10,
                    child: Image.asset(
                      back,
                      width: 250,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5.h,
                      horizontal: 0.h,
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone, color: Color(0xFF6F35A5), size: 40),
                    title: Container(
                      child: TextFormField(
                        maxLength: 10,
                        keyboardType: TextInputType.number, // Set the keyboard type to number
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly, // Allow only digits
                        ],
                        controller: phoneController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Mobile number is required';
                          }
                          if (value.length != 10) {
                            return 'Phone number must be exactly \n 10 digits';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Phone",
                          hintStyle: GoogleFonts.baskervville(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
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
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Perform actions when Send OTP button is pressed
                        }
                      },
                      style: TextButton.styleFrom(
                          minimumSize: Size(150, 40),
                          backgroundColor: Color(0xFF907ad6)),
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
                    leading: const Icon(Icons.person_2,
                        color: Color(0xFF6F35A5), size: 40),
                    title: Container(
                      child: TextFormField(
                        controller: usernameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Username",
                          labelStyle: GoogleFonts.baskervville(color: Color(0xFF6F35A5),fontWeight: FontWeight.w500),
                          hintStyle: GoogleFonts.baskervville(
                            color: Color(0xFF6F35A5),
                            fontWeight: FontWeight.bold,
                          ),
                          prefixText: 'S-',
                          errorText: isUsernameAlreadyTaken
                              ? 'This username is already taken.'
                              : null,
                        ),
                        onChanged: (String Username) {
                          Username = "S-" + Username;
                          getUsername(Username);
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        createUsername();
                      },
                      style: TextButton.styleFrom(
                          minimumSize: Size(60, 40),
                          backgroundColor: Color(0xFF907ad6)),
                      child: Text(
                        "Next   ",
                        style: GoogleFonts.notoSerif(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
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
