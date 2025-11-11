import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paypal_integreation/features/checkout/presentation/manger/payment_cubit.dart';
import 'package:paypal_integreation/features/checkout/presentation/views/widgets/order_info.dart';
import 'package:paypal_integreation/features/checkout/presentation/views/widgets/payment_method_sheets.dart';
import 'package:paypal_integreation/features/checkout/presentation/views/widgets/total_price.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../data/repos/checkout_repo_impl.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 15),
          Expanded(child: Image.asset("assets/images/Group 6.png")),
          SizedBox(height: 15),
          OrderInfo(nameProduct: 'Order Subtotal', priceProduct: 42.97),
          SizedBox(height: 3),
          OrderInfo(nameProduct: 'Discount', priceProduct: 0),
          SizedBox(height: 3),
          OrderInfo(nameProduct: 'Shipping', priceProduct: 8),
          SizedBox(height: 17),
          Divider(
            color: Color(0xffC7C7C7),
            thickness: 1,
            indent: 17,
            endIndent: 17,
          ),
          SizedBox(height: 15),
          TotalPrice(totalPrice: 50.97),
          SizedBox(height: 16),
          CustomButton(
            txt: 'Complete Payment',
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => PaymentDetails()),
              // );
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                builder: (context) {
                  return BlocProvider(
                    create: (context) => PaymentCubit(CheckOutRepoImpl()),
                    child: PaymentMethodsSheets(),
                  );
                },
              );
            },
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
