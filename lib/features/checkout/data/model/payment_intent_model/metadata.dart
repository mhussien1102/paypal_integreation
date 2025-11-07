// lib/model/payment_intent/metadata.dart

class Metadata {
  Metadata({this.data});

  Map<String, dynamic>? data;

  factory Metadata.fromJson(dynamic json) {
    if (json == null) return Metadata();
    if (json is Map<String, dynamic>) return Metadata(data: json);
    return Metadata();
  }

  Map<String, dynamic> toJson() => data ?? {};
}
