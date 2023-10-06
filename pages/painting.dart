import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../utils/routes.dart'; // Import the 'sizer' package if you're using it.

enum Certificate { yes, no }
enum Exam { yes, no }

class Painting extends StatefulWidget {
  @override
  _PaintingState createState() => _PaintingState();

}

class _PaintingState extends State<Painting> {

  void onTapIcon() {

  }

  double fontSize = 16.0; // Set your desired font size here.
  Exam? exam = Exam.yes;
  bool isc1Selected = false;
  bool isc2Selected = false;
  bool isc3Selected = false;
  bool isc4Selected = false;
  bool isc5Selected = false;
  Certificate? selectedCertificate=Certificate.yes;
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery
        .of(context)
        .size
        .width * 0.04;
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0.5.h,
            horizontal: 0.h,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('  Types of paintings: ',
            textAlign: TextAlign.left,
            style: GoogleFonts.baskervville(
              color : Color(0xFF6F35A5),
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        new ListTile(
          //leading: const Icon(Icons.email,color: Colors.black,size: 40),
          title: new TextFormField(
            decoration: new InputDecoration(
              hintText: " Canvas,Glass painting.......",
              hintStyle: GoogleFonts.baskervville(color: Colors.grey,
              fontSize: fontSize,),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Required';
              }
            },
          ),
        ),Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0.5.h,
            horizontal: 0.h,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('   Select age of students you teach',
            textAlign: TextAlign.left,
            style: GoogleFonts.baskervville(
              color : Color(0xFF6F35A5),
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0.5.h,
            horizontal: 0.h,
          ),
        ),
        CheckboxListTile(
          activeColor: Color(0xFF6F35A5),
          title: Text('Below 5 years',
            style: GoogleFonts.baskervville(
              fontSize: fontSize,
              color : Color(0xFF6F35A5),
              fontWeight: FontWeight.bold,
            ),),

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
          activeColor: Color(0xFF6F35A5),
          title: Text('5-18 Years',
            style: GoogleFonts.baskervville(
              fontSize: fontSize,
              color : Color(0xFF6F35A5),
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
          activeColor: Color(0xFF6F35A5),
          title: Text('19-30 Years',
            style: GoogleFonts.baskervville(
              fontSize: fontSize,
              color : Color(0xFF6F35A5),
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
          activeColor: Color(0xFF6F35A5),
          title: Text('Above 30 Year',
            style: GoogleFonts.baskervville(
              fontSize: fontSize,
              color : Color(0xFF6F35A5),
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
          activeColor: Color(0xFF6F35A5),
          title: Text('No Age Bar', style: GoogleFonts.baskervville(
            fontSize: fontSize,
            color : Color(0xFF6F35A5),
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
            vertical: 0.5.h,
            horizontal: 0.h,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('   No. of students/batch',
            textAlign: TextAlign.left,
            style: GoogleFonts.baskervville(
              fontSize: fontSize,
              color : Color(0xFF6F35A5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        new ListTile(
          //leading: const Icon(Icons.email,color: Colors.black,size: 40),
          title: new TextFormField(
            keyboardType: TextInputType.number,
            decoration: new InputDecoration(
              hintText: " 10,20.......",
              hintStyle: GoogleFonts.baskervville(color: Colors.grey,fontSize: fontSize),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Required';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0.5.h,
            horizontal: 0.h,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('   Description of your class',
            textAlign: TextAlign.left,
            style: GoogleFonts.baskervville(
              fontSize: fontSize,
              color : Color(0xFF6F35A5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        new ListTile(
          //leading: const Icon(Icons.email,color: Colors.black,size: 40),
          title: new TextFormField(
            controller: _textController,
            maxLines: 3, // Set the number of lines you want for your text area
            decoration: new InputDecoration(
              hintText: " A/c class......",
              hintStyle: GoogleFonts.baskervville(color: Colors.grey,
              fontSize: fontSize
              ),
            ),

            validator: (value) {
              if (value!.isEmpty) {
                return 'Required';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0.5.h,
            horizontal: 0.h,
          ),
        ),
        Row(
            children: <Widget>[
              Text('    Certificate Provided By You :',
                style: GoogleFonts.baskervville(
                  fontSize: fontSize,
                  color : Color(0xFF6F35A5),
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
              activeColor: Color(0xFF6F35A5),
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
                color : Color(0xFF6F35A5),
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
              activeColor: Color(0xFF6F35A5),
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
                color : Color(0xFF6F35A5),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0.5.h,
            horizontal: 0.h,
          ),
        ),
        Row(
            children: <Widget>[
              Text('    Do you prepare students for the exam :',
                style: GoogleFonts.baskervville(
                  fontSize: fontSize,
                  color : Color(0xFF6F35A5),
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
              activeColor: Color(0xFF6F35A5),
              value: Exam.yes,
              groupValue: exam,
              onChanged: (Exam? value) {
                setState(() {
                  exam = value;
                });
              },
            ),
            Text(
              'YES',
              style: GoogleFonts.baskervville(
                fontSize: fontSize,
                color : Color(0xFF6F35A5),
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
              activeColor: Color(0xFF6F35A5),
              value: Exam.no,
              groupValue: exam,
              onChanged: (Exam? value) {
                setState(() {
                  exam = value;
                });
              },
            ),
            Text(
              'NO',
              style: GoogleFonts.baskervville(
                fontSize: fontSize,
                color : Color(0xFF6F35A5),
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
      ],
    );
  }
}