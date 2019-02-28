import 'package:ecommerce/main.dart';
import 'package:ecommerce/models/list_items.dart';
import 'package:ecommerce/models/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'redux/actions.dart';

typedef OnItemAddedCallback = Function(Products product);

class AddItemDialog extends StatefulWidget {
  const AddItemDialog({Key key, this.item}) : super(key: key);
  final ListItems item;

  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<Products, OnItemAddedCallback>(
      converter: (Store<Products> store) => (Products product) {
            store.dispatch(
              AddItemToCartAction(
                item: ListItems(
                  name: widget.item.name,
                  id: widget.item.id,
                  quantity: widget.item.quantity,
                ),
              ),
            );
          },
      builder: (BuildContext context, OnItemAddedCallback callback) =>
          AlertDialog(
            title: const Text('Add Item'),
            contentPadding: const EdgeInsets.all(16.0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(widget.item.name),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: Colors.blue,
                    ),
                    const SizedBox(
                      width: 70.0,
                    ),
                    FlatButton(
                      child: const Text(
                        'Add Item',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        callback(product);
                        Navigator.of(context).pop();
                      },
                      color: Colors.blue,
                    ),
                  ],
                ),
              ],
            ),
          ),
    );
  }
}
