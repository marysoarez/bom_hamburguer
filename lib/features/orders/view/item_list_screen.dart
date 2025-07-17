import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/order_view_model.dart';
import '../../../core/models/item_model.dart';
import '../widgets/item_tile.dart';

class ItemListScreen extends StatefulWidget {
  const ItemListScreen({super.key});

  @override
  State<ItemListScreen> createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  late Future<void> _loadCartFuture;

  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<OrderViewModel>(context, listen: false);
    _loadCartFuture = viewModel.loadCart();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OrderViewModel>(context);

    final sandwiches = viewModel.items.where((i) => i.type == ItemType.sandwich).toList();
    final extras = viewModel.items.where((i) => i.type == ItemType.extra).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('BOM HAMBURGUER'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: _loadCartFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Sanduíches', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              ...sandwiches.map((item) => ItemTile(item: item)),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Extras', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              ...extras.map((item) => ItemTile(item: item)),
            ],
          );
        },
      ),
    );
  }
}
