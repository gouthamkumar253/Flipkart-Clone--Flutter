import 'package:ecommerce/models/list_items.dart';
import 'package:ecommerce/models/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'redux/actions.dart';

typedef OnDeletedCallback = Function(ListItems item);

class DeleteItemDialog extends StatefulWidget {
  const DeleteItemDialog(this.item);

  final ListItems item;

  @override
  _DeleteItemDialogState createState() => _DeleteItemDialogState(item);
}

class _DeleteItemDialogState extends State<DeleteItemDialog> {
  _DeleteItemDialogState(this.item);

  final ListItems item;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<Products, OnDeletedCallback>(
      converter: (Store<Products> store) => (ListItems item) {
        store.dispatch(DeleteItemFromCartAction(item));
      },
      builder: (BuildContext context, OnDeletedCallback callback) =>
          AlertDialog(
            title: const Text('Are You Sure?'),
            contentPadding: const EdgeInsets.all(16.0),
            content: Row(
              children: <Widget>[
                Text(item.id.toString()),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              FlatButton(
                onPressed: () {
                  callback(item);
                  Navigator.of(context).pop();
                },
                child: const Text('Delete Item'),
              ),
            ],
          ),
    );
  }
}

typedef OnItemAddedCallback = Function(ListItems item);

