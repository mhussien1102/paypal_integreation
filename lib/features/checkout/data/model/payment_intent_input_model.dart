class Payment_intent_input_model {
  final String amount;
  final String currency;

  Payment_intent_input_model({required this.amount, required this.currency});

  toJson() {
    return {'amount': amount, 'currency': currency};
  }
}
