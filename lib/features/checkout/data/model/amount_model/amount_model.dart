/// total : "100"
/// currency : "USD"
/// details : {"subtotal":"100","shipping":"0","shipping_discount":0}

class AmountModel {
  AmountModel({String? total, String? currency, Details? details}) {
    _total = total;
    _currency = currency;
    _details = details;
  }

  AmountModel.fromJson(dynamic json) {
    _total = json['total'];
    _currency = json['currency'];
    _details = json['details'] != null
        ? Details.fromJson(json['details'])
        : null;
  }
  String? _total;
  String? _currency;
  Details? _details;
  AmountModel copyWith({String? total, String? currency, Details? details}) =>
      AmountModel(
        total: total ?? _total,
        currency: currency ?? _currency,
        details: details ?? _details,
      );
  String? get total => _total;
  String? get currency => _currency;
  Details? get details => _details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    map['currency'] = _currency;
    if (_details != null) {
      map['details'] = _details?.toJson();
    }
    return map;
  }
}

/// subtotal : "100"
/// shipping : "0"
/// shipping_discount : 0

class Details {
  Details({String? subtotal, String? shipping, num? shippingDiscount}) {
    _subtotal = subtotal;
    _shipping = shipping;
    _shippingDiscount = shippingDiscount;
  }

  Details.fromJson(dynamic json) {
    _subtotal = json['subtotal'];
    _shipping = json['shipping'];
    _shippingDiscount = json['shipping_discount'];
  }
  String? _subtotal;
  String? _shipping;
  num? _shippingDiscount;
  Details copyWith({
    String? subtotal,
    String? shipping,
    num? shippingDiscount,
  }) => Details(
    subtotal: subtotal ?? _subtotal,
    shipping: shipping ?? _shipping,
    shippingDiscount: shippingDiscount ?? _shippingDiscount,
  );
  String? get subtotal => _subtotal;
  String? get shipping => _shipping;
  num? get shippingDiscount => _shippingDiscount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subtotal'] = _subtotal;
    map['shipping'] = _shipping;
    map['shipping_discount'] = _shippingDiscount;
    return map;
  }
}
