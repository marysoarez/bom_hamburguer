import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/orders/view/cart_screen.dart';
import 'features/orders/view/item_list_screen.dart';
import 'features/orders/view/payment_screen.dart';
import 'features/orders/view_model/order_view_model.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(

      create: (_) => OrderViewModel(),
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
