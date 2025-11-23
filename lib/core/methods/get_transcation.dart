import '../../features/checkout/data/model/amount_model/amount_model.dart';
import '../../features/checkout/data/model/amount_model/deatils.dart';
import '../../features/checkout/data/model/item_list_model/item.dart';
import '../../features/checkout/data/model/item_list_model/item_list_model.dart';

({AmountModel amount, ItemListModel itemList}) getTranscationData() {
  var amount = AmountModel(
    currency: "USD",
    details: Details(shipping: "0", shippingDiscount: 0, subtotal: "100"),
    total: "100",
  );

  List<OrderItemModel> orders = [
    OrderItemModel(currency: "USD", name: "Apple", price: "4", quantity: 10),
    OrderItemModel(currency: "USD", name: "Banana", price: "5", quantity: 12),
  ];
  var itemList = ItemListModel(items: orders);

  return (amount: amount, itemList: itemList);
}
