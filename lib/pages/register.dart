import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/routes.dart';

class RegisterPage extends StatefulWidget{
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final topImage = "assets/main_top.png";
  final teacher = "assets/teacher2.jpg";
  final student = "assets/student2.jpg";
  @override
Widget build(BuildContext context) {
  return Sizer(builder: (context, orientation, deviceType)
  {
    double fontSize = MediaQuery.of(context).size.width * 0.06;
    return Scaffold(
      body: SingleChildScrollView(
                  child: Form(
                  key: _formKey,
                  child: Column(
                  children: [
                  Container(
                  width: 500,
                  height: 250,
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
              ]
              ),
              ),
             Column(
            children: [
                  Column(
                  children: [
                        Text(
                        "Register As!",
                        style: GoogleFonts.baskervville(
                          textStyle: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          ),
                          ),
                          ),
                        Padding(
                        padding: EdgeInsets.symmetric(
                        vertical: 6.h,
                        horizontal: 0.h,
              ),
                        ),
                    Row(
                      children:[
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 0.h,
                            horizontal: 2.h,
                          ),
                        ),
                    Container(
                      width: 140, // Set the width and height to create a square container
                      height: 140,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF907ad6), // Border color
                          width: 2.0, // Border width
                        ),
                      ),
                      child: Image.asset(
                        teacher, // Replace with your image URL
                        fit: BoxFit.cover, // This property ensures the image covers the square
                      ),
                    ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 0.h,
                            horizontal: 2.h,
                          ),
                        ),
                    Container(
                      width: 140, // Set the width and height to create a square container
                      height: 140,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF907ad6), // Border color
                          width: 2.0, // Border width
                        ),// You can set the background color of the square if needed
                      ),
                      child: Image.asset(
                         student,
                        fit: BoxFit.cover, // This property ensures the image covers the square
                      ),
                    ),
                    ]
                    ),
                    Row(
                      children:[
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 2.h,
                            horizontal: 2.h,
                          ),
                        ),
                    ElevatedButton(
                  onPressed: () {

                    Navigator.pushNamed(context, MyRoutes.teacherRoute);
                  },
                  style: TextButton.styleFrom(minimumSize: Size(140, 30),backgroundColor: Color(0xFF907ad6)),
                  child: Text("Teacher",
                      textAlign: TextAlign.center,style:GoogleFonts.baskervville(textStyle:TextStyle(color: Colors.white,fontSize: fontSize,fontWeight: FontWeight.bold)),
                ),
                ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5.h,
              horizontal: 2.h,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.studentRoute);
            },
            style: TextButton.styleFrom(minimumSize: Size(140,30),backgroundColor: Color(0xFF907ad6)),
            child: Text("Student",style:GoogleFonts.baskervville(textStyle:TextStyle(color: Colors.white,fontSize: fontSize,fontWeight: FontWeight.bold)),
            ),
          )]
      ),
  ]
      )
      ]
             )
    ]
      )
    )
      )
    );
  });
  }
}