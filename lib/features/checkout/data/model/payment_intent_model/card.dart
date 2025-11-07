// lib/model/payment_intent/card.dart

class CardOptions {
  CardOptions({
    this.installments,
    this.mandateOptions,
    this.network,
    this.requestThreeDSecure,
  });

  dynamic installments;
  dynamic mandateOptions;
  dynamic network;
  String? requestThreeDSecure;

  factory CardOptions.fromJson(dynamic json) {
    if (json == null) return CardOptions();
    return CardOptions(
      installments: json['installments'],
      mandateOptions: json['mandate_options'],
      network: json['network'],
      requestThreeDSecure: json['request_three_d_secure'],
    );
  }

  Map<String, dynamic> toJson() => {
    'installments': installments,
    'mandate_options': mandateOptions,
    'network': network,
    'request_three_d_secure': requestThreeDSecure,
  };
}
