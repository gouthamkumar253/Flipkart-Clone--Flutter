import 'package:ecommerce/models/list_items.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/redux/actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'main.dart';

typedef OnItemRemovedFromWishListCallback = Function(Products product);

bool buttonState = false;

class WishListItem extends StatefulWidget {
  const WishListItem(this.item);

  final ListItems item;

  @override
  State<StatefulWidget> createState() => _WishListItemState();
}

class _WishListItemState extends State<WishListItem> {
  @override
  Widget build(BuildContext context) {
    // TODO(username): implement build
    return StoreConnector<Products, OnItemRemovedFromWishListCallback>(
      converter: (Store<Products> store) => (Products product) {
            store.dispatch(
              DeleteItemFromWishListAction(
                item: ListItems(
                  name: widget.item.name,
                  id: widget.item.id,
                  quantity: widget.item.quantity,
                  image: widget.item.image,
                ),
              ),
            );
          },
      builder:
          (BuildContext context, OnItemRemovedFromWishListCallback callback) =>
              Container(
                height: 130.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                    width: 0.5,
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      widget.item.image,
                      width: 130.0,
                      height: 130.0,
                      fit: BoxFit.contain,
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: ListTile(
                                    title: Text(
                                      widget.item.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 16.0),
                                    ),
                                    subtitle: const Text('Brand info'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 25.0),
                                  child: IconButton(
                                    icon: const Icon(Icons.delete),
                                    color: Colors.grey,
                                    onPressed: () {
                                      callback(product);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 14.0),
                                  child: Container(
                                    height: 20.0,
                                    width: 50.0,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: Colors.green,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, top: 3.0),
                                      child: Stack(
                                        children: const <Widget>[
                                          Text(
                                            '4.5',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12.0),
                                          ),
                                          Positioned(
                                            right: 5.0,
                                            bottom: 3.0,
                                            child: Icon(
                                              Icons.star,
                                              size: 15.0,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                const Text(
                                  '(25)',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 14.0),
                              child: Container(
                                child: Row(
                                  children: const <Widget>[
                                    Text(
                                      '\u20B950',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22.0,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Text(
                                      '100',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      '50% off',
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
