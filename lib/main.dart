import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux/redux.dart';
import 'package:splashscreen/splashscreen.dart';

import 'redux/reducers.dart';
bool initial=true;
Products product = Products();

void main() {
  final Store<Products> store =
      Store<Products>(productsReducer, initialState: Products());

  runApp(ShoppingApp(store: store));
}

class ShoppingApp extends StatefulWidget {
  const ShoppingApp({Key key, this.store}) : super(key: key);

  final Store<Products> store;

  @override
  State<StatefulWidget> createState() => _ShoppingApp();
}

class _ShoppingApp extends State<ShoppingApp> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<Products>(
      store: widget.store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(
            seconds: 5,
            navigateAfterSeconds: AfterSplash(store: widget.store),
            image: Image.asset(
              'images/flipkart_logo.png',
              fit: BoxFit.contain,
              colorBlendMode: BlendMode.color,
            ),
            backgroundColor: Colors.blue,
            //styleTextUnderTheLoader: const TextStyle(),
            photoSize: 50.0,
            loaderColor: Colors.white),
      ),
    );
  }
}

class AfterSplash extends StatelessWidget {
  const AfterSplash({Key key, this.store}) : super(key: key);
  final Store<Products> store;

  @override
  Widget build(BuildContext context) {
    return ShoppingCart(store: store);
  }
}
