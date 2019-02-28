import 'package:ecommerce/cart_items.dart';
import 'package:ecommerce/models/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('hi');
    return StoreConnector<Products, Products>(
      converter: (Store<Products> store) => store.state,
      builder: (BuildContext context, Products product) => Stack(
            children: <Widget>[
              GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: product.cartItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                itemBuilder: (BuildContext context, int index)=>CartItem(item: product.cartItems[index]),
              ),
            ],
          ),
    );
  }
}

class ShowPurchaseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: const RaisedButton(
      onPressed: null,
      child:  Text('Purchase'),
    ));
  }
}
