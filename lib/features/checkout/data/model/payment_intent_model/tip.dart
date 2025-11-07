// lib/model/payment_intent/tip.dart

/// Stripe بترجع tip كـ Object ممكن يبقى فاضي أو فيه مفاتيح مختلفة.
/// خلّيناه Map مرن.
class Tip {
  Tip({this.data});

  Map<String, dynamic>? data;

  factory Tip.fromJson(dynamic json) {
    if (json == null) return Tip();
    if (json is Map<String, dynamic>) return Tip(data: json);
    return Tip();
  }

  Map<String, dynamic> toJson() => data ?? {};
}
