// lib/model/payment_intent/payment_method_option.dart
import 'card.dart';

class PaymentMethodOptions {
  PaymentMethodOptions({this.card, this.link});

  CardOptions? card;
  LinkOptions? link;

  factory PaymentMethodOptions.fromJson(dynamic json) {
    if (json == null) return PaymentMethodOptions();
    return PaymentMethodOptions(
      card: json['card'] != null ? CardOptions.fromJson(json['card']) : null,
      link: json['link'] != null ? LinkOptions.fromJson(json['link']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (card != null) map['card'] = card!.toJson();
    if (link != null) map['link'] = link!.toJson();
    return map;
  }
}

/// LinkOptions اتحطت هنا (ملهاش ملف مستقل حسب طلبك)
class LinkOptions {
  LinkOptions({this.persistentToken});
  dynamic persistentToken;

  factory LinkOptions.fromJson(dynamic json) =>
      LinkOptions(persistentToken: json?['persistent_token']);

  Map<String, dynamic> toJson() => {'persistent_token': persistentToken};
}
