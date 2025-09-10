import 'package:flutter/material.dart';

import '../utils/style.dart';

class CustomButton extends StatelessWidget {
  final String txt;
  final Function() onPressed;
  const CustomButton({super.key, required this.txt, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      minWidth: double.infinity,
      onPressed: onPressed,
      height: 73,
      color: Color(0xff34A853),
      child: Text(txt, style: AppTextStyles.text22w500),
    );
  }
}
