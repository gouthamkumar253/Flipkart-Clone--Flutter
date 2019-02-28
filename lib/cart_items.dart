import 'package:ecommerce/delete_item_dialog.dart';
import 'package:ecommerce/models/list_items.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key key, this.item}) : super(key: key);
  final ListItems item;

  void openDeleteItem(BuildContext context, ListItems item) {
    showDialog<Widget>(
        context: context,
        builder: (BuildContext context) => DeleteItemDialog(item));
  }

  @override
  Widget build(BuildContext context) {
    // TODO(username): implement build
    return Card(
      elevation: 10.0,
      child: Stack(
        children: <Widget>[
          ListTile(
            title: Text(item.name),
            subtitle: const Text('Product description to be displayed here'),
          ),
          Positioned(
            right: 10.0,
            top: 10.0,
            child: Image.asset(
              'images/shoe1.png',
              width: 150.0,
              height: 200.0,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton.icon(
                      icon: const Icon(Icons.bookmark_border),
                      onPressed: () {},
                      color: Colors.white,
                      label: const Text('Save for Later'),
                    ),
                  ),
                  Expanded(
                    child: RaisedButton.icon(
                      onPressed: () => openDeleteItem(context, item),
                      icon: const Icon(Icons.delete),
                      color: Colors.white,
                      label: const Text(
                        'Remove Product',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
