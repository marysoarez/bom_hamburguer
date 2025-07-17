import 'package:flutter/material.dart';
import '../../../core/models/item_model.dart';
import '../../../core/models/cart_model.dart';
import '../../../core/models/order_model.dart';
import '../../../core/mocks/mock_data.dart';

class OrderViewModel extends ChangeNotifier {
  final CartModel _cart = CartModel();
  final List<ItemModel> _items = MockData.getItems();
  final List<OrderModel> _orders = [];

  List<ItemModel> get items => _items;
  CartModel get cart => _cart;
  List<OrderModel> get orders => _orders;

  void addItemToCart(ItemModel item) {
    try {
      _cart.addItem(item);
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  void createOrder(String customerName) {
    final order = OrderModel(
      customerName: customerName,
      items: _cart.getItems(),
      total: _cart.getTotal(),
      createdAt: DateTime.now(),
    );

    _orders.add(order);
    clearCart();
    notifyListeners();
  }
}
