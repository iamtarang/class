import 'package:classfindr/pages/student.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:classfindr/pages/teacher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/routes.dart';

class Dance extends StatefulWidget {
  @override
  _DanceState createState() => _DanceState();
}

enum Certificate { yes, no }

enum Exam { yes, no }

class _DanceState extends State<Dance> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController nosController = TextEditingController();

  bool isc1Selected = false;
  bool isc2Selected = false;
  bool isc3Selected = false;
  bool isc4Selected = false;
  bool isc5Selected = false;
  Certificate? selectedCertificate = Certificate.yes;
  Exam? selectedExam = Exam.yes;
  TeacherPage t = TeacherPage();
  void saveDanceClassData() async {
    if (_formKey.currentState!.validate()) {
      CollectionReference danceClasses =
          FirebaseFirestore.instance.collection('dance_classes');

      await danceClasses.add({
        'type_of_dance': classController.text,
        'age_group': {
          'below_5_years': isc1Selected,
          '5_18_years': isc2Selected,
          '19_30_years': isc3Selected,
          'above_30_years': isc4Selected,
          'no_age_bar': isc5Selected,
        },
        'no_of_students_per_batch': nosController.text,
        'description': _textController.text,
        'certificate_provided': selectedCertificate == Certificate.yes,
        'prepare_students_for_exams': selectedExam == Exam.yes,
      });

      // Navigate to the next screen or perform other actions
      Navigator.pushNamed(context, MyRoutes.otpgeneratorRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      double fontSize = MediaQuery.of(context).size.width * 0.05;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Dance",
            style: GoogleFonts.baskervville(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.bold),
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '   Type of Dance',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.baskervville(
                          fontWeight: FontWeight.bold, fontSize: fontSize),
                    ),
                  ),
                  ListTile(
                    //leading: const Icon(Icons.email,color: Colors.black,size: 40),
                    title: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Type of class is required';
                        }
                      },
                      controller: classController,
                      decoration: InputDecoration(
                        hintText: " western,classical,hiphop.......",
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
                    child: Text(
                      '   Select age of students you teach',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.baskervville(
                          fontWeight: FontWeight.bold, fontSize: fontSize),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 1.h,
                      horizontal: 0.h,
                    ),
                  ),
                  CheckboxListTile(
                    title: Text('Below 5 Years',
                        style: GoogleFonts.baskervville(
                            fontWeight: FontWeight.bold, fontSize: fontSize)),
                    value: isc1Selected,
                    onChanged: (newValue) {
                      setState(() {
                        isc1Selected = newValue ?? false;
                      });
                    },
                    visualDensity: VisualDensity(
                      vertical: -4,
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  CheckboxListTile(
                    title: Text(
                      '5-18 Years',
                      style: GoogleFonts.baskervville(
                          fontWeight: FontWeight.bold, fontSize: fontSize),
                    ),
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
                    title: Text(
                      '19-30 Years',
                      style: GoogleFonts.baskervville(
                          fontWeight: FontWeight.bold, fontSize: fontSize),
                    ),
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
                    title: Text(
                      'Above 30 Year',
                      style: GoogleFonts.baskervville(
                          fontWeight: FontWeight.bold, fontSize: fontSize),
                    ),
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
                    title: Text(
                      'No Age Bar',
                      style: GoogleFonts.baskervville(
                          fontWeight: FontWeight.bold, fontSize: fontSize),
                    ),
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
                    child: Text(
                      '   No. of students/batch',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.baskervville(
                          fontWeight: FontWeight.bold, fontSize: fontSize),
                    ),
                  ),
                  ListTile(
                    //leading: const Icon(Icons.email,color: Colors.black,size: 40),
                    title: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required';
                        }
                      },
                      controller: nosController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
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
                    child: Text(
                      nameController.text,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.baskervville(
                          fontWeight: FontWeight.bold, fontSize: fontSize),
                    ),
                  ),
                  ListTile(
                    //leading: const Icon(Icons.email,color: Colors.black,size: 40),
                    title: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required';
                        }
                      },
                      controller: _textController,
                      maxLines:
                          3, // Set the number of lines you want for your text area
                      decoration: InputDecoration(
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
                      Text(
                        '    Certificate Provided By You :',
                        style: GoogleFonts.baskervville(
                          textStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
                        style: GoogleFonts.notoSerif(
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
                      Text(
                        '    Do you prepare students for exams :',
                        style: GoogleFonts.baskervville(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
                          textStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                          ),
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
                          textStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 2.h,
                      horizontal: 10.h,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: saveDanceClassData,
                      style: TextButton.styleFrom(
                        minimumSize: Size(60, 40),
                        backgroundColor: Color(0xFF907ad6),
                      ),
                      child: Text(
                        "Next   ",
                        style: GoogleFonts.baskervville(
                          color: Colors.white,
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
