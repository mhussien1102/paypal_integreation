import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';

class OrderInfo extends StatelessWidget {
  final String nameProduct;
  final double priceProduct;
  const OrderInfo({
    super.key,
    required this.nameProduct,
    required this.priceProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(nameProduct, style: AppTextStyles.text18w400),
        Text("\$$priceProduct", style: AppTextStyles.text18w400),
      ],
    );
  }
}
