import '../../data/local/cart_database.dart';
import 'item_model.dart';

class CartModel {
  ItemModel? sandwich;
  ItemModel? fries;
  ItemModel? soda;

  void addItem(ItemModel item) {
    if (item.type == ItemType.sandwich) {
      if (sandwich != null) {
        throw Exception("Só é permitido um sanduíche por pedido.");
      }
      sandwich = item;
    } else if (item.id == 'fries') {
      if (fries != null) {
        throw Exception("Só é permitido uma porção de fritas por pedido.");
      }
      fries = item;
    } else if (item.id == 'soda') {
      if (soda != null) {
        throw Exception("Só é permitido um refrigerante por pedido.");
      }
      soda = item;
    }
  }

  double getTotal() {
    double total = 0.0;
    if (sandwich != null) total += sandwich!.price;
    if (fries != null) total += fries!.price;
    if (soda != null) total += soda!.price;

    if (sandwich != null && fries != null && soda != null) {
      return total * 0.8;
    } else if (sandwich != null && soda != null) {
      return total * 0.85;
    } else if (sandwich != null && fries != null) {
      return total * 0.90;
    }
    return total;
  }

  List<ItemModel> getItems() {
    return [sandwich, fries, soda].whereType<ItemModel>().toList();
  }

  void clear() {
    sandwich = null;
    fries = null;
    soda = null;
  }

  bool isEmpty() => sandwich == null && fries == null && soda == null;



  Future<void> saveToDatabase() async {
    final items = getItems();
    await CartDatabase().saveItems(items);
  }

  Future<void> loadFromDatabase() async {
    final items = await CartDatabase().loadItems();
    clear();
    for (var item in items) {
      try {
        addItem(item);
      } catch (_) {
      }
    }
  }

  Future<void> clearFromDatabase() async {
    clear();
    await CartDatabase().clearCart();
  }

  void removeItem(ItemModel item) {
    if (item.type == ItemType.sandwich && sandwich?.id == item.id) {
      sandwich = null;
    } else if (item.id == 'fries' && fries?.id == item.id) {
      fries = null;
    } else if (item.id == 'soda' && soda?.id == item.id) {
      soda = null;
    }
  }
}
