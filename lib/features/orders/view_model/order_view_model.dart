import 'package:flutter/material.dart';
import '../../../core/models/item_model.dart';
import '../../../core/models/cart_model.dart';
import '../../../core/models/order_model.dart';
import '../../../core/mocks/mock_data.dart';
import '../../../data/local/cart_database.dart';  // <- import do banco

class OrderViewModel extends ChangeNotifier {
  final CartModel _cart = CartModel();
  final List<ItemModel> _items = MockData.getItems();
  final List<OrderModel> _orders = [];
  final CartDatabase _db = CartDatabase();

  List<ItemModel> get items => _items;
  CartModel get cart => _cart;
  List<OrderModel> get orders => _orders;

  Future<void> loadCart() async {
    final savedItems = await _db.loadItems();
    _cart.clear();
    for (var item in savedItems) {
      try {
        _cart.addItem(item);
      } catch (_) {
        // ignora itens duplicados
      }
    }
    notifyListeners();
  }

  Future<void> addItemToCart(ItemModel item) async {
    try {
      _cart.addItem(item);
      await _db.saveItems(_cart.getItems());
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> clearCart() async {
    _cart.clear();
    await _db.clearCart();
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

  Future<void> removeItemFromCart(ItemModel item) async {
    _cart.removeItem(item);
    await _db.saveItems(_cart.getItems());
    notifyListeners();
  }

}
