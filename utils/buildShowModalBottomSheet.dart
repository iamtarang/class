import 'package:classfindr/utils/forgotpwdmail.dart';
import 'package:classfindr/utils/routes.dart';
import 'package:flutter/material.dart';

import 'Forgotpwdbtnwidget.dart';

Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) =>
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Make Selection!', style: Theme
                    .of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold)),
                Text('Select one of the given option to reset your password ',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.black),),
                const SizedBox(height: 30.0),
                Forgotpwdbtnwidget(
                  btnicon: Icons.mail_outline_rounded,
                  title: 'E-mail',
                  subtitle: 'Reset via Email Verification',
                  onTap: () {
                    Navigator.pushNamed(context, MyRoutes.mailRoute);
                  },
                ),
                const SizedBox(height: 20.0),
                Forgotpwdbtnwidget(
                  btnicon: Icons.mobile_friendly_rounded,
                  title: 'Phone No',
                  subtitle: 'Reset via Phone Verification',
                  onTap: () {},
                ),
              ],
            ),
          )
  );
}
