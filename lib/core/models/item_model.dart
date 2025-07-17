enum ItemType { sandwich, extra }

class ItemModel {
  final String id;
  final String name;
  final double price;
  final ItemType type;

  ItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.type,
  });

  factory ItemModel.sandwich({
    required String id,
    required String name,
    required double price,
  }) {
    return ItemModel(
      id: id,
      name: name,
      price: price,
      type: ItemType.sandwich,
    );
  }

  factory ItemModel.extra({
    required String id,
    required String name,
    required double price,
  }) {
    return ItemModel(
      id: id,
      name: name,
      price: price,
      type: ItemType.extra,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'type': type.toString(),
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      type: map['type'] == 'ItemType.sandwich'
          ? ItemType.sandwich
          : ItemType.extra,
    );
  }
}
