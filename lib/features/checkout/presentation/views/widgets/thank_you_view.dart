import 'package:flutter/material.dart';
import 'package:paypal_integreation/features/checkout/presentation/views/widgets/thank_you_view_body.dart';

import '../../../../../core/methods/build_appbar.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: ThankYouViewBody());
  }
}
