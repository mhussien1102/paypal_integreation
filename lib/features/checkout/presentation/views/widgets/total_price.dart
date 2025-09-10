import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';

class TotalPrice extends StatelessWidget {
  final double totalPrice;
  const TotalPrice({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Total", style: AppTextStyles.text24w600),
        Text("\$$totalPrice", style: AppTextStyles.text24w600),
      ],
    );
  }
}
