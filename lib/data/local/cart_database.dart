import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../core/models/item_model.dart';

class CartDatabase {
  static final CartDatabase _instance = CartDatabase._internal();
  factory CartDatabase() => _instance;
  CartDatabase._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    return _database = await _initDB();
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'cart.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cart_items (
        id TEXT PRIMARY KEY,
        name TEXT,
        price REAL,
        type TEXT
      )
    ''');
  }

  Future<void> saveItems(List<ItemModel> items) async {
    final db = await database;
    await db.delete('cart_items');
    for (var item in items) {
      await db.insert('cart_items', item.toMap());
    }
  }

  Future<List<ItemModel>> loadItems() async {
    final db = await database;
    final maps = await db.query('cart_items');

    return maps.map((map) => ItemModel.fromMap(map)).toList();
  }

  Future<void> clearCart() async {
    final db = await database;
    await db.delete('cart_items');
  }
}
