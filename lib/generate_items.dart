import 'package:ecommerce/main.dart';
import 'package:ecommerce/models/list_items.dart';
import 'package:ecommerce/models/products.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'redux/actions.dart';

typedef OnItemGeneratedCallback = Function(Products product);

List<ListItems> itemsGenerator() {
  final List<ListItems> itemList = <ListItems>[];
  for (int i = 0; i < 10; i++) {
    final ListItems item = ListItems(name: null, quantity: -1,id:-1);
    item.name = faker.company.name();
    item.quantity = 10;
    item.id = i + 1;
    itemList.add(item);
    //print(itemList.last.name+itemList.last.id.toString());
  }
  for (int i = 0; i < 10; i++) {
    print(itemList[i].name + itemList[i].id.toString());
  }
  return itemList;
}

// ignore: must_be_immutable
class GenerateItemDialog extends StatelessWidget {
  List<ListItems> itemList = itemsGenerator();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<Products, OnItemGeneratedCallback>(
      converter: (Store<Products> store) => (Products product) {
            store.dispatch(
              GenerateListAction(itemList: itemList),
            );
          },
      builder: (BuildContext context, OnItemGeneratedCallback callback) =>
          AlertDialog(
            title: const Text('Generate Item'),
            contentPadding: const EdgeInsets.all(16.0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Are you sure?'),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        color: Colors.blue,
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        child: const Text(
                          'Generate',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          print('length of list is' + itemList.length.toString());
                          callback(product);
                          Navigator.of(context).pop();
                        },
                        color: Colors.blue,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
    );
  }
}
