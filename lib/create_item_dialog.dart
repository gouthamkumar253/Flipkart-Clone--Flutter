import'dart:math';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/models/list_items.dart';
import 'package:ecommerce/models/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'redux/actions.dart';

typedef OnItemCreatedCallback = Function(Products product);

class CreateItemDialog extends StatefulWidget {
  @override
  _CreateItemDialogState createState() => _CreateItemDialogState();
}

class _CreateItemDialogState extends State<CreateItemDialog> {
  final ListItems item = ListItems(name: null,quantity: -1,id: -1,image: null);
  static int listId = 1;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Random random=Random();
  List<String> imagesList=<String>[
    'images/shoe1.png',
    'images/shoe2.png',
    'images/shoe3.png',
    'images/shoe4.png',
  ];
  @override
  Widget build(BuildContext context) {
    return StoreConnector<Products, OnItemCreatedCallback>(
      converter: (Store<Products> store) => (Products product) {
        store.dispatch(
          AddItemToListAction(
            item: ListItems(
              name: item.name,
              id: listId++,
              quantity: item.quantity,
              image: imagesList[random.nextInt(4)],
            ),
          ),
        );
      },
      builder: (BuildContext context, OnItemCreatedCallback callback) =>
          AlertDialog(
            title: const Text('Create Item'),
            contentPadding: const EdgeInsets.all(16.0),
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: TextEditingController(),
                    autofocus: true,
                    decoration: const InputDecoration(
                        labelText: 'Product Name', hintText: 'Enter Name'),
                    onChanged: (String text) {
                     // print('Form saved');
                      item.name = text;
                    },
                  ),
                  TextField(
                    controller: TextEditingController(),
                    autofocus: false,
                    decoration: const InputDecoration(
                        labelText: 'Product Quantity',
                        hintText: 'Enter Quantity'),
                    onChanged: (String text) {
                      item.quantity = int.parse(text);
                    },
                  ),
                  Center(
                    child: Row(
                      children: <Widget>[
                        RaisedButton(
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          color: Colors.blue,
                        ),
                        RaisedButton(
                          child: const Text(
                            'Create Item',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              print('submit action');
                              callback(product);
                            } else
                              print('Invalid');
                            Navigator.of(context).reassemble();
                          },
                          color: Colors.blue,
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
