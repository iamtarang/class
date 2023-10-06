import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../login_signup_btn.dart';

class welcome extends StatefulWidget{
  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  final topImage = "assets/first.jpg";
  final back = "assets/main_top.png";
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Sizer(builder: (context, orientation, deviceType) {
      double fontSize = MediaQuery
          .of(context)
          .size
          .width * 0.05;
      return Scaffold(
        body: SingleChildScrollView(
          key: _formKey,
          child: Column(
            children: [
            Container(

            width: double.infinity,
            height: 500,
            // height: MediaQuery.of(context).size.height,
            child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Image.asset(
                      back,
                      width: 160,
                    ),
                  ),
                  Positioned(
                    top: 200,
                    left: 10,
                    child: Image.asset(
                      topImage,
                      width: 350,
                    ),
                  ),
                  Positioned(
                    top:110,

                    child: Text(
                      'Welcome to kakshafindr',
                      style: GoogleFonts.baskervville(
                        color: Color(0xFF9163cb), // Text color
                        fontSize: fontSize*1.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ]
            ),

          ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 4.h,
                  horizontal: 0.h,
                ),
              ),
          Row(
            children:[

              Spacer(),
              Expanded(
                flex: 8,
                child: LoginAndSignupBtn(),
              ),
              Spacer(),
            ],
          ),
        ]),
      )
      );
    });
}
}