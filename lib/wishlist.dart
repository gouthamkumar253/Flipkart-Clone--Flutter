import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class WishList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Wishlist');
    return StoreConnector<Products, Products>(
      converter: (Store<Products> store) => store.state,
      builder: (BuildContext context, Products product) =>ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return WishListItem(product.wishListItems[index]);
        },
        itemCount: product.wishListItems.length,
      ),
    );
  }
}
