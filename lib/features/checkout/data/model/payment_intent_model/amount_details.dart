// lib/model/payment_intent/amount_details.dart
import 'tip.dart';

class AmountDetails {
  AmountDetails({this.tip});

  Tip? tip;

  factory AmountDetails.fromJson(dynamic json) {
    if (json == null) return AmountDetails();
    return AmountDetails(
      tip: json['tip'] != null ? Tip.fromJson(json['tip']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (tip != null) map['tip'] = tip!.toJson();
    return map;
  }
}
