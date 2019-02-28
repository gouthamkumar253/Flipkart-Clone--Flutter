//import 'package:ecommerce/models/cart_items.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'redux/reducers.dart';
Products product=Products();

void main() {
  final Store<Products> store =
      Store<Products>(productsReducer, initialState: Products());

  runApp(ShoppingApp(store));
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp(this.store);

  final Store<Products> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<Products>(
      store: store,
      child: MaterialApp(
        theme: ThemeData.light(),
        home: ShoppingCart(store: store),
      ),
    );
  }
}
