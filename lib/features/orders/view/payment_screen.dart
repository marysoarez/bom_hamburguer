import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/order_view_model.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _confirmOrder() {
    if (_formKey.currentState!.validate()) {
      final viewModel = Provider.of<OrderViewModel>(context, listen: false);
      viewModel.createOrder(_nameController.text);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pedido criado com sucesso!'), backgroundColor: Colors.green),
      );

      Navigator.popUntil(context, ModalRoute.withName('/'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final total = Provider.of<OrderViewModel>(context).cart.getTotal();

    return Scaffold(
      appBar: AppBar(title: const Text('Pagamento')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text('Total a pagar: R\$ ${total.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome do cliente'),
                validator: (value) =>
                value == null || value.isEmpty ? 'Informe o nome do cliente' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _confirmOrder,
                child: const Text('Confirmar Pedido'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
