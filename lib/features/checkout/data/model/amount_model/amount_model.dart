// amount_model.dart

import 'package:paypal_integreation/features/checkout/data/model/amount_model/deatils.dart';

/// total : "100"
/// currency : "USD"
/// details : {"subtotal":"100","shipping":"0","shipping_discount":0}

class AmountModel {
  AmountModel({
    required String total,
    required String currency,
    required Details details,
  }) : _total = total,
       _currency = currency,
       _details = details;

  AmountModel.fromJson(Map<String, dynamic> json)
    : _total = json['total'] as String,
      _currency = json['currency'] as String,
      _details = Details.fromJson(json['details']);

  final String _total;
  final String _currency;
  final Details _details;

  AmountModel copyWith({String? total, String? currency, Details? details}) =>
      AmountModel(
        total: total ?? _total,
        currency: currency ?? _currency,
        details: details ?? _details,
      );

  String get total => _total;
  String get currency => _currency;
  Details get details => _details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    map['currency'] = _currency;
    map['details'] = _details.toJson();
    return map;
  }
}
