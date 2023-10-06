import 'package:flutter/material.dart';

class Forgotpwdbtnwidget extends StatelessWidget {
  const Forgotpwdbtnwidget({
    required this.btnicon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    super.key,
  });
  final IconData btnicon;
  final String title,subtitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xFFF1E6FF),
        ),
        child: Row(
          children: [
            Icon(btnicon,size: 60.0),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: Theme.of(context).textTheme.headline6,),
                Text(subtitle,style: Theme.of(context).textTheme.bodyText2,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
