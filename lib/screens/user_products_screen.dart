import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/app_drawer.dart';
import '../widgets/user_product_item.dart';
import './edit_product_screen.dart';

class UserProductsScreen extends StatelessWidget {
  static const ROUTE_NAME = '/user-products';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
              onPressed: (() {
                Navigator.of(context).pushNamed(EditProductScreen.ROUTE_NAME);
              }),
              icon: const Icon(Icons.add)),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: ((context, index) => Column(
                  children: [
                    UserProductItem(
                        productsData.items[index].id,
                        productsData.items[index].title,
                        productsData.items[index].imageUrl),
                    Divider()
                  ],
                ))),
      ),
    );
  }
}
