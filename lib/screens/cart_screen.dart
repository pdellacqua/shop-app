import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart';
import '../widgets/cart_item.dart';
import '../providers/cart.dart' show Cart;

class CartScreen extends StatelessWidget {
  static const ROUTE_NAME = "/cart";

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: Column(children: [
        Card(
          margin: EdgeInsets.all(15),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Totale',
                    style: TextStyle(fontSize: 10),
                  ),
                  Spacer(),
                  Chip(
                    label: Text('\$${cart.totalAmount.toStringAsFixed(2)}'),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  TextButton(
                    child: Text(
                      'ORDER NOW',
                    ),
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                          cart.items.values.toList(), cart.totalAmount);
                          cart.clear();
                    },
                  )
                ]),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: ((context, index) {
            final cartItem = cart.items.values.toList()[index];
            return CartItem(
                id: cartItem.id,
                productId: cart.items.keys.toList()[index],
                title: cartItem.title,
                quantity: cartItem.quantity,
                price: cartItem.price);
          }),
          itemCount: cart.items.length,
        ))
      ]),
    );
  }
}
