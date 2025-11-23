import 'package:flutter/material.dart';

import 'cart_payment.dart';

class PaymentMethodListView extends StatefulWidget {
  const PaymentMethodListView({super.key, required this.updatePaymentMethod});

  final Function({required int index}) updatePaymentMethod;
  @override
  State<PaymentMethodListView> createState() => _PaymentMethodListViewState();
}

class _PaymentMethodListViewState extends State<PaymentMethodListView> {
  final List<String> paymentMethodItems = const [
    "assets/images/SVGRepo_iconCarrier.svg",
    'assets/images/Group.svg',
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentMethodItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                activeIndex = index;
                widget.updatePaymentMethod(index: activeIndex);
                setState(() {});
              },
              child: CardPayment(
                icon: paymentMethodItems[index],
                isActve: activeIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
