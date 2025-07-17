import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/orders/view/cart_screen.dart';
import 'features/orders/view/item_list_screen.dart';
import 'features/orders/view/payment_screen.dart';
import 'features/orders/view_model/order_view_model.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final OrderViewModel _orderViewModel;

  @override
  void initState() {
    super.initState();
    _orderViewModel = OrderViewModel();
    _orderViewModel.loadCart();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OrderViewModel>.value(
      value: _orderViewModel,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BOM HAMBURGUER',
        theme: ThemeData(primarySwatch: Colors.red),
        home: const ItemListScreen(),
        routes: {
          '/cart': (_) => const CartScreen(),
          '/payment': (_) => const PaymentScreen(),
        },
      ),
    );
  }
}
