import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:classfindr/utils/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class username extends StatefulWidget {
  _usernameState createState() => _usernameState();
}

class _usernameState extends State<username> {
  final back = "assets/login.webp";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late String username;

  bool _obscureText = false;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText; // Toggle the value
    });
  }
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
  void initState() {
    super.initState();
    passwordController = TextEditingController();
  }

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

      Navigator.pushReplacementNamed(context, MyRoutes.homeRoute);
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
      double fontSize = MediaQuery
          .of(context)
          .size
          .width * 0.05;

      return Scaffold(

        body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey, // Assign the form key
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5.h,
                      horizontal: 0.h,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 10,
                    child: Image.asset(
                      back,
                      width: 450,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 2.h,
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
                          labelStyle: GoogleFonts.baskervville(
                              color: Color(0xFF6F35A5),
                              fontWeight: FontWeight.bold),

                          hintStyle: GoogleFonts.baskervville(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),

                          prefixText: 'S-',
                          errorText: isUsernameAlreadyTaken
                              ? 'This username is already taken.'
                              : null,
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
                        onChanged: (String Username) {
                          Username = "S-" + Username;
                          getUsername(Username);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 1.h,
                      horizontal: 0.h,
                    ),
                  ),
                    ListTile(
                    leading: const Icon(Icons.lock,
                    color: Color(0xFF6F35A5), size: 40),
                    title: Container(
                    child: TextFormField(
                        controller: passwordController,
                        obscureText: _obscureText,
                        textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                    labelText: "Password",
                      labelStyle: GoogleFonts.baskervville(
                          color: Color(0xFF6F35A5),
                          fontWeight: FontWeight.bold),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: _toggle,
                      ),
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
                    )
                    )
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
                        "  Next   ",
                        style: GoogleFonts.baskervville(
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
}

bool isPasswordValid(String password) {
  // Define a regular expression pattern for password validation
  // Password must contain at least one letter, one number, and be at least 8 characters long.
  final RegExp passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{8,}$');

  // Use the RegExp's 'hasMatch' method to check if the password is valid
  return passwordRegex.hasMatch(password);
}