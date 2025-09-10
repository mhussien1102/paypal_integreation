import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardPayment extends StatelessWidget {
  final String icon;
  final bool isActve;
  const CardPayment({super.key, required this.icon, this.isActve = false});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 62,
      width: 85,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isActve ? Color(0xff34A853) : Color.fromRGBO(0, 0, 0, 0.5),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: [
          BoxShadow(
            color: isActve ? Color(0xff34A853) : Colors.white,
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 0),
          ),
        ],
      ),
      duration: Duration(milliseconds: 300),
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.white,
        ),
        child: Center(child: SvgPicture.asset(icon)),
      ),
    );
  }
}
