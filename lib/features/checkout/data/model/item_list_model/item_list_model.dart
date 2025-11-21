// item_list_model.dart

import 'item.dart';

/// items : [{"name":"Apple","quantity":4,"price":"10","currency":"USD"},{"name":"Pineapple","quantity":5,"price":"12","currency":"USD"}]

class ItemListModel {
  ItemListModel({List<OrderItemModel>? items}) {
    _items = items;
  }

  ItemListModel.fromJson(dynamic json) {
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(OrderItemModel.fromJson(v));
      });
    }
  }

  List<OrderItemModel>? _items;

  ItemListModel copyWith({List<OrderItemModel>? items}) =>
      ItemListModel(items: items ?? _items);

  List<OrderItemModel>? get items => _items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
