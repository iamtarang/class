import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class membership extends StatefulWidget {
  @override
  _membershipState createState() => _membershipState();
}

class _membershipState extends State<membership> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType)
    {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              "Membership",
              style: GoogleFonts.notoSerif(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
      );
    });
}
}