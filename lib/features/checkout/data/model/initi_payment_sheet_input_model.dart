class InitiPaymentSheetModel {
  final String clientSecret;
  final String customerId;
  final String ephemeralKeySecret;

  InitiPaymentSheetModel({
    required this.clientSecret,
    required this.customerId,
    required this.ephemeralKeySecret,
  });
}
