import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:paypal_integreation/features/checkout/presentation/views/widgets/payment_item_info.dart';
import 'package:paypal_integreation/features/checkout/presentation/views/widgets/total_price.dart';

import '../../../../../core/utils/style.dart';
import 'card_info_widget.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Color(0xffEDEDED),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 66),
        child: Column(
          children: [
            Text("Thank You", style: AppTextStyles.text25w500),
            Text(
              "Your Transaction was successful",
              style: AppTextStyles.text20w400,
            ),
            SizedBox(height: 42),
            PaymentItemInfo(title: "Date", des: "10/11/2025"),
            SizedBox(height: 20),
            PaymentItemInfo(title: "Time", des: "10:25 Am"),
            SizedBox(height: 20),
            PaymentItemInfo(title: "To", des: "Cairo"),
            Divider(height: 60, thickness: 2),
            TotalPrice(totalPrice: 50.97),
            SizedBox(height: 30),
            CardInfoWidget(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(FontAwesomeIcons.barcode, size: 65),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.50, color: Color(0xff34A853)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "PAID",
                      style: AppTextStyles.text24w600.copyWith(
                        color: Color(0xff34A853),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: (MediaQuery.sizeOf(context).height * .2 + 20) / 5),
          ],
        ),
      ),
    );
  }
}
