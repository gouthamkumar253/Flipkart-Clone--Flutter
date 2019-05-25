import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/show_cart_items.dart';
import 'package:ecommerce/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ShowWishListItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO(username): implement build
    return StoreConnector<Products, Products>(
      converter: (Store<Products> store) => store.state,
      builder: (BuildContext context, Products product) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('My Wishlist'),
            actions: <Widget>[
              Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 150.0,
                      width: 40.0,
                      child: GestureDetector(
                        onTap: () {
                          //ignore: strong_mode_implicit_dynamic_method
                          Navigator.of(context).push(
                            //ignore: strong_mode_implicit_dynamic_type
                              MaterialPageRoute<BuildContext>(
                                  builder: (BuildContext context) =>
                                      ShowCartItems()));
                        },
                        child: Stack(
                          children: <Widget>[
                            const IconButton(
                              icon: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                              onPressed: null,
                            ),
                            product.cartItems.isEmpty
                                ? Container()
                                : Positioned(
                              left: 15.0,
                              child: Stack(
                                children: <Widget>[
                                  const Icon(
                                    Icons.brightness_1,
                                    size: 20.0,
                                    color: Colors.red,
                                  ),
                                  Positioned(
                                    top: 4.2,
                                    right: 5.8,
                                    child: Text(
                                      product.cartItems.length.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          body: Stack(
            children: <Widget>[
              WishList(),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                height: 56.0,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: null,
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                    width: 1.0, color: Colors.black12),
                              ),
                              color: Colors.black12,
                            ),
                            child: const Center(
                              child: Text(
                                'Clear All',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
//                      FlatButton(
//                        onPressed: () {},
//                        color: Colors.black12,
//                        child: const Text(
//                          'Clear All',
//                          style: TextStyle(
//                            color: Colors.blue,
//                            fontWeight: FontWeight.bold,
//                          ),
//                        ),
//                      ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: null,
                          child: Container(
                            color: Colors.black12,
                            child: const Center(
                              child: Text(
                                'Save List',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
//                      FlatButton(
//                        onPressed: () {},
//                        color: Colors.black12,
//                        child: const Text(
//                          'Save List',
//                          style: TextStyle(
//                            color: Colors.blue,
//                            fontWeight: FontWeight.bold,
//                          ),
//                        ),
//                      ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
