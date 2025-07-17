import '../models/item_model.dart';

class MockData {
  static List<ItemModel> getItems() {
    return [
      ItemModel.sandwich(id: 'x_burger', name: 'X Burger', price: 5.00),
      ItemModel.sandwich(id: 'x_egg', name: 'X Egg', price: 4.50),
      ItemModel.sandwich(id: 'x_bacon', name: 'X Bacon', price: 7.00),
      ItemModel.extra(id: 'fries', name: 'Fries', price: 2.00),
      ItemModel.extra(id: 'soda', name: 'Soft Drink', price: 2.50),
    ];
  }
}
