import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/cart.dart';
import './screens/product_detail_screen.dart';

import './providers/products.dart';
import './screens/products_overview_screen.dart';
import './screens/cart_screen.dart';
import './providers/orders.dart' show Orders;
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';
import './screens/edit_product_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Products()),
          ChangeNotifierProvider(create: (_) => Cart()),
          ChangeNotifierProvider(create: (_) => Orders()),
          
          ],
        child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
                  .copyWith(secondary: Colors.deepOrange),
              fontFamily: 'Lato'),
          home: ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.ROUTE_NAME      : (context) => ProductDetailScreen(),
            CartScreen.ROUTE_NAME               : (context) => CartScreen(),
            OrdersScreen.ROUTE_NAME             : (context) => OrdersScreen(),
            UserProductsScreen.ROUTE_NAME       : (context) => UserProductsScreen(),
            EditProductScreen.ROUTE_NAME        : (context) => EditProductScreen()
           },
        ));
  }
}
