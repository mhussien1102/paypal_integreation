import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';

class PaymentItemInfo extends StatelessWidget {
  final String title;
  final String des;
  const PaymentItemInfo({super.key, required this.title, required this.des});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.text18w400),
          Text(des, style: AppTextStyles.text18w600),
        ],
      ),
    );
  }
}
