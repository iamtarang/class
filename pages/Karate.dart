import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    double fontSize = MediaQuery
        .of(context)
        .size
        .width * 0.04;
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text('   Type of Karate',
            textAlign: TextAlign.left,
            style: GoogleFonts.baskervville(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6F35A5)
            ),
          ),
        ),
        new ListTile(
          title: new TextFormField(
            decoration: new InputDecoration(
              hintText: " Shotokon,Ashihara.......",
              hintStyle: GoogleFonts.baskervville(color: Colors.grey),
            ),
            keyboardType: TextInputType.name,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-Z]')),
            ],
            validator: (value) {
              if (value!.isEmpty) {
                return 'Required';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0.5,
            horizontal: 0.0,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('   Select age of students you teach',
            textAlign: TextAlign.left,
            style: GoogleFonts.baskervville(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6F35A5)
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0.5,
            horizontal: 0.0,
          ),
        ),
        CheckboxListTile(
          activeColor: Color(0xFF6F35A5),
          title: Text('Below 5 Years', style: GoogleFonts.baskervville(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6F35A5)
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
          activeColor: Color(0xFF6F35A5),
          title: Text('5-18 Years', style: GoogleFonts.baskervville(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6F35A5)
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
          title: Text('19-30 Years', style: GoogleFonts.baskervville(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6F35A5)
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
          title: Text('Above 30 Year', style: GoogleFonts.baskervville(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6F35A5)
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
              fontWeight: FontWeight.bold,
              color: Color(0xFF6F35A5)
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
            vertical: 0.5,
            horizontal: 0.0,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('   No. of students/batch',
            textAlign: TextAlign.left,
            style: GoogleFonts.baskervville(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6F35A5)
            ),
          ),
        ),
        new ListTile(
          //leading: const Icon(Icons.email,color: Colors.black,size: 40),
          title: new TextFormField(
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Required';
              }
            },
            decoration: new InputDecoration(
              hintText: " 10,20.......",
              hintStyle: GoogleFonts.baskervville(color: Colors.grey),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0.5,
            horizontal: 0.0,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('   Description of your class',
            textAlign: TextAlign.left,
            style: GoogleFonts.baskervville(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6F35A5)
            ),
          ),
        ),
        new ListTile(
          //leading: const Icon(Icons.email,color: Colors.black,size: 40),
          title: new TextFormField(
            controller: _textController,

            validator: (value) {
              if (value!.isEmpty) {
                return 'Required';
              }
            },
            maxLines: 3, // Set the number of lines you want for your text area
            decoration: new InputDecoration(
              hintText: " A/c class......",
              hintStyle: GoogleFonts.baskervville(color: Colors.grey),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0.5,
            horizontal: 0.0,
          ),
        ),

        Row(
            children: <Widget>[
              Text('    Certificate Provided By You :',
                style: GoogleFonts.baskervville(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6F35A5)
                ),
              ),
            ]
        ),

        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 4.0,
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
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6F35A5)
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 5.0,
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
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6F35A5)
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0.5,
            horizontal: 0.0,
          ),
        ),
        Row(
            children: <Widget>[
              Text('    Do you prepare students for the exam :',
                style: GoogleFonts.baskervville(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6F35A5)
                ),
              ),
            ]
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 4.0,
              ),
            ),
            Radio<Exam>(
              activeColor: Color(0xFF6F35A5),
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
                  color: Color(0xFF6F35A5)
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 5.0,
              ),
            ),
            Radio<Exam>(
              activeColor: Color(0xFF6F35A5),
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
                  color: Color(0xFF6F35A5)
              ),
            ),
          ],
        ),
      ],
    );
  }
}