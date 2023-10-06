import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:classfindr/constants.dart';
import 'package:sizer/sizer.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
    double fontSize = MediaQuery.of(context).size.width * 0.05;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don't have an Account ? " : "Already have an Account ? ",

          style:GoogleFonts.baskervville(color: kPrimaryColor,fontSize: fontSize,fontWeight: FontWeight.w500),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style:GoogleFonts.baskervville(
              color: kPrimaryColor,
              fontWeight: FontWeight.w600,
              fontSize: fontSize,
            ),
          ),
        )
      ],
    );
  }
    );}
}
