import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

import './product_item.dart';

class ProductsGrid extends StatelessWidget {

  final bool showFavs;

  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = this.showFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: ((context, index) {
        final p = products[index];
        return ChangeNotifierProvider.value(value: p, child: ProductItem());
      }),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
