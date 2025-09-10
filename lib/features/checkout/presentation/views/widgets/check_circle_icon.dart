import 'package:flutter/material.dart';

class CheckCircleIcon extends StatelessWidget {
  const CheckCircleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color(0xffD9D9D9),
      radius: 50,
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Colors.green,
        child: Icon(Icons.check, color: Colors.white, size: 50),
      ),
    );
  }
}
