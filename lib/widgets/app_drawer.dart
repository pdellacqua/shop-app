import 'package:flutter/material.dart';

import '../screens/orders_screen.dart';
import '../screens/user_products_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ), // AppBar
         
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrdersScreen.ROUTE_NAME);
            },
          ),

          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manager Products'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(UserProductsScreen.ROUTE_NAME);
            },
          ),
        ],
      ),
    );
  }
}
