import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/models/item_model.dart';
import '../view_model/order_view_model.dart';

class ItemTile extends StatelessWidget {
  final ItemModel item;

  const ItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<OrderViewModel>(context, listen: false);

    return ListTile(
      title: Text(item.name),
      subtitle: Text('R\$ ${item.price.toStringAsFixed(2)}'),
      trailing: ElevatedButton(
        onPressed: () {
          try {
            viewModel.addItemToCart(item);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${item.name} adicionado ao carrinho!'), backgroundColor: Colors.green),
            );
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
            );
          }
        },
        child: const Text('Adicionar'),
      ),
    );
  }
}
