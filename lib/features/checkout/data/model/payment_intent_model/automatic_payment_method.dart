// lib/model/payment_intent/automatic_payment_method.dart

class AutomaticPaymentMethods {
  AutomaticPaymentMethods({this.enabled});

  bool? enabled;

  factory AutomaticPaymentMethods.fromJson(dynamic json) {
    if (json == null) return AutomaticPaymentMethods();
    return AutomaticPaymentMethods(enabled: json['enabled']);
  }

  Map<String, dynamic> toJson() => {'enabled': enabled};
}
