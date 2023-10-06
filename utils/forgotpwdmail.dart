import 'package:classfindr/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class forgotmail extends StatefulWidget {
  @override
  _forgotmailState createState() => _forgotmailState();
}

class _forgotmailState extends State<forgotmail> {
  final back = "assets/forgotpwd.png";
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      double fontSize = MediaQuery.of(context).size.width * 0.05;
      return Scaffold(
          body: SingleChildScrollView(
              child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                width: 320,
              ),
            ),
            Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Forget Password',
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                      Text(
                        '\nSelect one of the given option to reset your password ',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(color: Colors.black),
                      ),
                    ])),
            ListTile(
              leading:
                  const Icon(Icons.email, color: Color(0xFF6F35A5), size: 40),
              title: Container(
                child: TextFormField(
                  keyboardType: TextInputType
                      .emailAddress, // Set the keyboard type to email address
                  controller:
                      emailController, // Use the appropriate controller for email
                  decoration: InputDecoration(
                    hintText: "E-mail",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
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
                        )),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an email address';
                    } else if (!isEmailValid(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null; // Return null if the input is valid
                  },
                ),
              ),
            ),
            ListTile(
                leading:
                    const Icon(Icons.lock, color: Color(0xFF6F35A5), size: 40),
                title: Container(
                    child: TextFormField(
                  controller: passwordController,
                  obscureText: _obscureText,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: _toggle,
                    ),
                    hintStyle: GoogleFonts.baskervville(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: fontSize),
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
                        )),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    } else if (!isPasswordValid(value)) {
                      return 'Password must be at least 8 characters long \n and contain at least one letter and one number';
                    }
                    return null; // Return null if the input is valid
                  },
                ))),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, MyRoutes.loginRoute);
                  }
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
          ],
        ),
      )));
    });
  }
}

bool isEmailValid(String email) {
  // Define a regular expression pattern for email validation
  final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  // Use the RegExp's 'hasMatch' method to check if the email is valid
  return emailRegex.hasMatch(email);
}

bool isPasswordValid(String password) {
  // Define a regular expression pattern for password validation
  // Password must contain at least one letter, one number, and be at least 8 characters long.
  final RegExp passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{8,}$');

  // Use the RegExp's 'hasMatch' method to check if the password is valid
  return passwordRegex.hasMatch(password);
}
