import 'package:flutter/material.dart';

import '../utils/style.dart';

class CustomButton extends StatelessWidget {
  final String txt;
  final Function() onPressed;
  final bool isLoading;
  const CustomButton({
    super.key,
    required this.txt,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      minWidth: double.infinity,
      onPressed: onPressed,
      height: 73,
      color: Color(0xff34A853),
      child: isLoading
          ? CircularProgressIndicator()
          : Text(txt, style: AppTextStyles.text22w500),
    );
  }
}
