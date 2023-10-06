import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/routes.dart';

class karate extends StatefulWidget{
  @override
  _karateState createState() => _karateState();

}

enum Certificate { yes,no }
enum Exam { yes,no }

class _karateState extends State<karate> {
  TextEditingController _textController = TextEditingController();
  bool isc1Selected = false;
  bool isc2Selected = false;
  bool isc3Selected = false;
  bool isc4Selected = false;
  bool isc5Selected = false;
  Certificate? selectedCertificate = Certificate.yes;
  Exam? selectedExam = Exam.yes;

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      double fontSize = MediaQuery.of(context).size.width * 0.05;
      return new Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.black,
            title: new Text("Karate",style:GoogleFonts.baskervville(color: Colors.white,fontSize: fontSize,fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 2.h,
                    horizontal: 0.h,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('   Type of Karate',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.baskervville(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new ListTile(
                  //leading: const Icon(Icons.email,color: Colors.black,size: 40),
                  title: new TextField(
                    decoration: new InputDecoration(
                      hintText: " Shotokon,Ashihara.......",
                      hintStyle: GoogleFonts.baskervville(color: Colors.grey),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 2.h,
                    horizontal: 0.h,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('   Select age of students you teach',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.baskervville(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 1.h,
                    horizontal: 0.h,
                  ),
                ),
                CheckboxListTile(
                  title: Text('Below 5 Years',style: GoogleFonts.baskervville(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),),
                  value: isc1Selected,
                  onChanged: (newValue) {
                    setState(() {
                      isc2Selected = newValue ?? false;
                    });
                  },
                  visualDensity: VisualDensity(
                    vertical: -4,
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: Text('5-18 Years',style: GoogleFonts.baskervville(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),),

                  value: isc2Selected,
                  onChanged: (newValue) {
                    setState(() {
                      isc2Selected = newValue ?? false;
                    });
                  },
                  visualDensity: VisualDensity(
                    vertical: -4,
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                ),

                CheckboxListTile(
                  title: Text('19-30 Years',style: GoogleFonts.baskervville(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),),
                  value: isc3Selected,
                  onChanged: (newValue) {
                    setState(() {
                      isc3Selected = newValue ?? false;
                    });
                  },
                  visualDensity: VisualDensity(
                    vertical: -4,
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                ),

                CheckboxListTile(
                  title: Text('Above 30 Year',style: GoogleFonts.baskervville(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),),
                  value: isc4Selected,
                  onChanged: (newValue) {
                    setState(() {
                      isc4Selected = newValue ?? false;
                    });
                  },
                  visualDensity: VisualDensity(
                    vertical: -4,
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: Text('No Age Bar',style: GoogleFonts.baskervville(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),),
                  value: isc5Selected,
                  onChanged: (newValue) {
                    setState(() {
                      isc5Selected = newValue ?? false;
                    });
                  },
                  visualDensity: VisualDensity(
                    vertical: -4,
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 2.h,
                    horizontal: 0.h,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('   No. of students/batch',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.baskervville(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new ListTile(
                  //leading: const Icon(Icons.email,color: Colors.black,size: 40),
                  title: new TextField(
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      hintText: " 10,20.......",
                      hintStyle: GoogleFonts.baskervville(color: Colors.grey),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 2.h,
                    horizontal: 0.h,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('   Description of your class',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.baskervville(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new ListTile(
                  //leading: const Icon(Icons.email,color: Colors.black,size: 40),
                  title: new TextField(
                    controller: _textController,
                    maxLines: 3, // Set the number of lines you want for your text area
                    decoration: new InputDecoration(
                      hintText: " A/c class......",
                      hintStyle: GoogleFonts.baskervville(color: Colors.grey),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 2.h,
                    horizontal: 0.h,
                  ),
                ),

                Row(
                    children: <Widget>[
                      Text('    Certificate Provided By You :',
                        style: GoogleFonts.baskervville(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]
                ),

                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0.h,
                        horizontal: 4.h,
                      ),
                    ),
                    Radio<Certificate>(
                      activeColor: Colors.black,
                      value: Certificate.yes,
                      groupValue: selectedCertificate,
                      onChanged: (Certificate? value) {
                        setState(() {
                          selectedCertificate = value;
                        });
                      },
                    ),
                    Text(
                      'YES',
                      style: GoogleFonts.baskervville(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0.h,
                        horizontal: 5.h,
                      ),
                    ),
                    Radio<Certificate>(
                      activeColor: Colors.black,
                      value: Certificate.no,
                      groupValue: selectedCertificate,
                      onChanged: (Certificate? value) {
                        setState(() {
                          selectedCertificate = value;
                        });
                      },
                    ),
                    Text(
                      'NO',
                      style: GoogleFonts.baskervville(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 2.h,
                    horizontal: 0.h,
                  ),
                ),
                Row(
                    children: <Widget>[
                      Text('    Do you prepare students for the exam :',
                        style: GoogleFonts.baskervville(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]
                ),

                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0.h,
                        horizontal: 4.h,
                      ),
                    ),
                    Radio<Exam>(
                      activeColor: Colors.black,
                      value: Exam.yes,
                      groupValue: selectedExam,
                      onChanged: (Exam? value) {
                        setState(() {
                          selectedExam = value;
                        });
                      },
                    ),
                    Text(
                      'YES',
                      style: GoogleFonts.baskervville(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0.h,
                        horizontal: 5.h,
                      ),
                    ),
                    Radio<Exam>(
                      activeColor: Colors.black,
                      value: Exam.no,
                      groupValue: selectedExam,
                      onChanged: (Exam? value) {
                        setState(() {
                          selectedExam = value;
                        });
                      },
                    ),
                    Text(
                      'NO',
                      style: GoogleFonts.baskervville(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child : ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.otpgeneratorRoute,arguments: 'T');
                    },
                    style: TextButton.styleFrom(minimumSize: Size(60, 40),backgroundColor: Color(0xFF907ad6)),
                    child: Text("Next   ",style:GoogleFonts.baskervville(color: Colors.white,fontSize: fontSize,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ));
    }
    );
  }
}