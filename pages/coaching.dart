import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/routes.dart';

class CoachingForm extends StatefulWidget {
  @override
  _CoachingFormState createState() => _CoachingFormState();
}
enum Certificate { yes,no }
enum Batch { yes,no }

class _CoachingFormState extends State<CoachingForm> {
  TextEditingController _textController = TextEditingController();
  bool isc1Selected = false;
  bool isc2Selected = false;
  bool isc3Selected = false;
  bool isc4Selected = false;
  bool isc5Selected = false;
  bool isc6Selected = false;
  bool isc7Selected = false;
  bool isc8Selected = false;

  bool isAtLeastOneCheckboxSelected() {
    return isc1Selected ||
        isc2Selected ||
        isc3Selected ||
        isc4Selected ||
        isc5Selected ||
        isc6Selected ||
        isc7Selected ||
        isc8Selected;
  }
  Certificate? selectedCertificate = Certificate.yes;
  Batch? selectedBatch = Batch.yes;

  String selectedAverageResult = "Below 60%";
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
          vertical: 3.0,
          horizontal: 0.0,
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Text('   Medium you teach',
          textAlign: TextAlign.left,
          style:GoogleFonts.baskervville(fontWeight: FontWeight.bold,
              color: Color(0xFF6F35A5),
              fontSize: fontSize),
        ),
      ),
      new ListTile(
        //leading: const Icon(Icons.email,color: Colors.black,size: 40),
        title: new TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Required';
            }
          },
          decoration: new InputDecoration(
            hintText: " English,Gujarati.......",
            hintStyle: GoogleFonts.baskervville(color: Colors.grey,
                fontSize: fontSize
            ),
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
        child: Text('   Board you cater',
          textAlign: TextAlign.left,
          style: GoogleFonts.baskervville(fontWeight: FontWeight.bold,
             color: Color(0xFF6F35A5),
              fontSize: fontSize),
        ),
      ),
      new ListTile(
        //leading: const Icon(Icons.email,color: Colors.black,size: 40),
        title: new TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Required';
            }
          },
          decoration: new InputDecoration(
            hintText: " GSEB,CBSE.......",
            hintStyle: GoogleFonts.baskervville(color: Colors.grey,
                fontSize: fontSize
            ),
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
        child: Text('   Standard you teach',
          textAlign: TextAlign.left,
          style: GoogleFonts.baskervville(fontWeight: FontWeight.bold,
              color: Color(0xFF6F35A5),
              fontSize: fontSize),
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
        title: Text('Pre-School',
          style: GoogleFonts.baskervville(fontWeight: FontWeight.bold,
              color: Color(0xFF6F35A5),
              fontSize: fontSize),
        ),
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
        title: Text('1-4',
          style: GoogleFonts.baskervville(fontWeight: FontWeight.bold,
              color: Color(0xFF6F35A5),
              fontSize: fontSize),
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
        activeColor: Color(0xFF6F35A5),
        title: Text('5-8',
          style: GoogleFonts.baskervville(fontWeight: FontWeight.bold,
              color: Color(0xFF6F35A5)
              ,fontSize: fontSize),
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
        activeColor: Color(0xFF6F35A5),
        title: Text('9-10',
          style: GoogleFonts.baskervville(fontWeight: FontWeight.bold,
              color: Color(0xFF6F35A5),
              fontSize: fontSize),),
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
        title: Text('11-12(Science)',
          style: GoogleFonts.baskervville(fontWeight: FontWeight.bold,
              color: Color(0xFF6F35A5),
              fontSize: fontSize),),
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
      CheckboxListTile(
        activeColor: Color(0xFF6F35A5),
        title: Text('11-12(Commerce)',
          style: GoogleFonts.baskervville(fontWeight: FontWeight.bold,
              color: Color(0xFF6F35A5),
              fontSize: fontSize),),
        value: isc6Selected,
        onChanged: (newValue) {
          setState(() {
            isc6Selected = newValue ?? false;
          });
        },
        visualDensity: VisualDensity(
          vertical: -4,
        ),
        controlAffinity: ListTileControlAffinity.leading,
      ),
      CheckboxListTile(
        activeColor: Color(0xFF6F35A5),
        title: Text('11-12(Arts)',
          style: GoogleFonts.baskervville(fontWeight: FontWeight.bold,
              color: Color(0xFF6F35A5),
              fontSize: fontSize),),
        value: isc7Selected,
        onChanged: (newValue) {
          setState(() {
            isc7Selected = newValue ?? false;
          });
        },
        visualDensity: VisualDensity(
          vertical: -4,
        ),
        controlAffinity: ListTileControlAffinity.leading,
      ),
      CheckboxListTile(
        activeColor: Color(0xFF6F35A5),
        title: Text('Others',
          style: GoogleFonts.baskervville(fontWeight: FontWeight.bold,
              color: Color(0xFF6F35A5),
              fontSize: fontSize),),
        value: isc8Selected,
        onChanged: (newValue) {
          setState(() {
            isc8Selected = newValue ?? false;
          });
        },
        visualDensity: VisualDensity(
          vertical: -4,
        ),
        controlAffinity: ListTileControlAffinity.leading,
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 0.0,
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Text('   Subjects/Courses taught by you',
          textAlign: TextAlign.left,
          style: GoogleFonts.baskervville(fontWeight: FontWeight.bold,
              color: Color(0xFF6F35A5)
              ,fontSize: fontSize),
        ),
      ),
      new ListTile(
        //leading: const Icon(Icons.email,color: Colors.black,size: 40),
        title: new TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Required';
            }
          },
          keyboardType: TextInputType.text,
          decoration: new InputDecoration(
            hintText: " Maths,competitive exams(cmat).......",
            hintStyle: GoogleFonts.baskervville(color: Colors.grey,
                fontSize: fontSize
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 0.0,
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Text('   Description of your class',
          textAlign: TextAlign.left,
          style: GoogleFonts.baskervville(fontWeight: FontWeight.bold,
              color: Color(0xFF6F35A5),
              fontSize: fontSize),
        ),
      ),
      new ListTile(
        //leading: const Icon(Icons.email,color: Colors.black,size: 40),
        title: new TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Required';
            }
          },
          controller: _textController,
          maxLines: 3, // Set the number of lines you want for your text area
          decoration: new InputDecoration(
            hintText: " A/c class......",
            hintStyle: GoogleFonts.baskervville(color: Colors.grey,fontSize: fontSize),
          ),
        ),
      ),

      Padding(
        padding: EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 0.0,
        ),
      ),

      Row(
          children: <Widget>[
            Text('    Certificate provided by you :',
              style: GoogleFonts.baskervville(
                fontSize: fontSize,
                color: Color(0xFF6F35A5),
                fontWeight: FontWeight.bold,
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
            activeColor:Color(0xFF6F35A5),
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
              color: Color(0xFF6F35A5),
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0.0,
              horizontal: 5.0,
            ),
          ),
          Radio<Certificate>(
            activeColor:Color(0xFF6F35A5),
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
              color: Color(0xFF6F35A5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 0.0,
        ),
      ),
      Row(
          children: <Widget>[
            Text('    Is there any batch for girls only :',
              style: GoogleFonts.baskervville(
                fontSize: fontSize,
                color: Color(0xFF6F35A5),
                fontWeight: FontWeight.bold,
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
          Radio<Batch>(
            activeColor:Color(0xFF6F35A5),
            value: Batch.yes,
            groupValue: selectedBatch,
            onChanged: (Batch? value) {
              setState(() {
                selectedBatch = value;
              });
            },
          ),
          Text(
            'YES',
            style: GoogleFonts.baskervville(
              textStyle: TextStyle(
                fontSize: fontSize,
                color:Color(0xFF6F35A5) ,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 0.0,
              horizontal: 5.0,
            ),
          ),
          Radio<Batch>(
            activeColor:Color(0xFF6F35A5),
            value: Batch.no,
            groupValue: selectedBatch,
            onChanged: (Batch? value) {
              setState(() {
                selectedBatch = value;
              });
            },
          ),
          Text(
            'NO',
            style: GoogleFonts.baskervville(
              textStyle: TextStyle(
                fontSize: fontSize,
                color: Color(0xFF6F35A5),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 0.0,
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Text('   No. of students/batch',
          textAlign: TextAlign.left,
          style: GoogleFonts.baskervville(fontWeight: FontWeight.bold,
              color: Color(0xFF6F35A5),
              fontSize: fontSize),
        ),
      ),
      new ListTile(
        //leading: const Icon(Icons.email,color: Colors.black,size: 40),
        title: new TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Required';
            }
          },
          keyboardType: TextInputType.number,
          decoration: new InputDecoration(
            hintText: " 10,20.......",
            hintStyle: TextStyle(color: Colors.grey,
    fontSize: fontSize
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 0.0,
        ),
      ),
      Row(
          children:<Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '   Average Results    ',
                textAlign: TextAlign.left,
                style: GoogleFonts.baskervville(fontWeight: FontWeight.bold,
                    color: Color(0xFF6F35A5),
                    fontSize: fontSize),
              ),
            ),

            DropdownButton<String>(
              value: selectedAverageResult,
              onChanged: (newValue) {
                setState(() {
                  selectedAverageResult = newValue!;
                }
                );
              },
              items: <String>[
                'Below 60%',
                'Between 60%-80%',
                'Above 80%',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,style:GoogleFonts.baskervville(fontWeight: FontWeight.bold,color: Color(0xFF6F35A5),fontSize: fontSize)),
                );
              }).toList(),
            ),
          ]
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: 0.5,
          horizontal: 0.0,
        ),
      ),

    ],
  );
}
}