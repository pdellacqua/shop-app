import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon:
                  Icon(this._expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  this._expanded = !this._expanded;
                });
              },
            ),
          ),
          if (this._expanded)
            Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
              height: min(widget.order.products.length * 20.0 + 10, 10),
              child: ListView(
                  children: widget.order.products
                      .map((product) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product.title,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${product.quantity}x \$${product.price}',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                            ],
                          ))
                      .toList()),
            )
        ],
      ),
    );
  }
}
