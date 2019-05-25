import 'dart:math';

import 'package:ecommerce/main.dart';
import 'package:ecommerce/models/list_items.dart';
import 'package:ecommerce/models/products.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'redux/actions.dart';

Random random = Random();
List<String> imagesList = <String>[
  'images/shoe1.png',
  'images/shoe2.png',
  'images/shoe3.png',
  'images/shoe4.png',
];

typedef OnItemGeneratedCallback = Function(Products product);

final List<ListItems> itemList = <ListItems>[];

void itemsGenerator() {
  for (int i = 0; i < 10; i++) {
    final ListItems item =
        ListItems(image: null, name: null, quantity: -1, id: -1);
    item.name = faker.company.name();
    item.quantity = 10;
    item.id = i + 1;
    item.image = imagesList[random.nextInt(4)];
    item.wishList = false;
    itemList.add(item);
    //print(itemList.last.name+itemList.last.id.toString());
  }
  for (int i = 0; i < 10; i++) {
    print(itemList[i].name + itemList[i].id.toString());
  }
}

// ignore: must_be_immutable
class GenerateItemDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<Products, OnItemGeneratedCallback>(
        converter: (Store<Products> store) => (Products product) {
              store.dispatch(
                GenerateListAction(itemList: itemList),
              );
            },
        builder: (BuildContext context, OnItemGeneratedCallback callback) {
          if (initial) {
            initial = false;
            itemsGenerator();
            return Container(
              child: callback(product),
            );
          } else
            return Container();
        }
//          AlertDialog(
//            title: const Text('Generate Item'),
//            contentPadding: const EdgeInsets.all(16.0),
//            content: Column(
//              mainAxisSize: MainAxisSize.min,
//              children: <Widget>[
//                const Text('Are you sure?'),
//                Row(
//                  children: <Widget>[
//                    Expanded(
//                      child: FlatButton(
//                        child: const Text(
//                          'Cancel',
//                          style: TextStyle(color: Colors.white),
//                        ),
//                        onPressed: () {
//                          Navigator.of(context).pop();
//                        },
//                        color: Colors.blue,
//                      ),
//                    ),
//                    Expanded(
//                      child: FlatButton(
//                        child: const Text(
//                          'Generate',
//                          style: TextStyle(color: Colors.white),
//                        ),
//                        onPressed: () {
//                          print('length of list is' + itemList.length.toString());
//                          callback(product);
//                          Navigator.of(context).pop();
//                        },
//                        color: Colors.blue,
//                      ),
//                    ),
//                  ],
//                )
//              ],
//            ),
//          ),
        );
  }
}
