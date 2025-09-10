import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/style.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      height: 73,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(width: 23),
          SvgPicture.asset("assets/icons/logo.svg"),
          SizedBox(width: 25),
          Text.rich(
            TextSpan(
              text: "Credit Card\n", // هنا \n علشان ينزل سطر
              style: AppTextStyles.text18w400,
              children: [
                TextSpan(
                  text: "Master Card **78",
                  style: AppTextStyles.text16w400,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
