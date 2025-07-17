import 'item_model.dart';

class OrderModel {
  final String customerName;
  final List<ItemModel> items;
  final double total;
  final DateTime createdAt;

  OrderModel({
    required this.customerName,
    required this.items,
    required this.total,
    required this.createdAt,
  });
}
