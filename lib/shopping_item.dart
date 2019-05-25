import 'package:ecommerce/models/list_items.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/product_details.dart';
import 'package:ecommerce/redux/actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'main.dart';

typedef OnWishListTriggerCallback = Function(Products product);

class ShoppingItem extends StatefulWidget {
  const ShoppingItem({Key key, this.item}) : super(key: key);
  final ListItems item;

  @override
  State<StatefulWidget> createState() => _ShoppingItem();
}

class _ShoppingItem extends State<ShoppingItem> {
  Icon icon = const Icon(Icons.favorite_border);


  @override
  Widget build(BuildContext context) {
    return StoreConnector<Products, OnWishListTriggerCallback>(
      converter: (Store<Products> store) => (Products product) {
        if(widget.item.wishList) {
          store.dispatch(
            AddItemToWishListAction(
              item: ListItems(
                name: widget.item.name,
                id: widget.item.id,
                quantity: widget.item.quantity,
                image: widget.item.image,
              ),
            ),
          );
        }
        else{
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
        }
          },
      builder: (BuildContext context, OnWishListTriggerCallback callback) =>
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  //ignore: strong_mode_implicit_dynamic_type
                  MaterialPageRoute<BuildContext>(
                      builder: (BuildContext context) =>
                          ProductDetails(widget.item)));
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                  width: 0.5,
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 8.0,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.item.image.toString()),
                            fit: BoxFit.contain,
                          ),
                          //color: Colors.blue,
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              right: 0.0,
                              top: 0.0,
                              child: IconButton(
                                icon: const Icon(Icons.favorite),
                                color: widget.item.wishList ? Colors.red : Colors.grey,
                                iconSize: 30.0,
                                onPressed: () {
                                  setState(
                                    () {
                                      widget.item.wishList=!widget.item.wishList;
                                      print( widget.item.wishList);
                                    },
                                  );
                                  callback(product);
                                },
                              ),
                            ),
                          ],
                        ),
                        height: 200.0,
                        width: MediaQuery.of(context).size.width / 2,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text(
                          'Brand Name',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 14.0, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          widget.item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 18.0, color: Colors.black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
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
                                  fontSize: 14.0, color: Colors.deepOrange),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
