import 'package:ecommerce/delete_item_dialog.dart';
import 'package:ecommerce/models/list_items.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  const CartItem({Key key, this.item}) : super(key: key);
  final ListItems item;

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  bool buttonState = false;

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
//          ListTile(
//            title: Text(widget.item.name),
//            subtitle: const Text('Product description to be displayed here'),
//          ),

          Positioned(
            left: 10.0,
            top: 10.0,
            child: Container(
              height: 250,
              width: 340,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      trailing: Image.asset(
                        widget.item.image,
                        width: 150.0,
                        height: 100.0,
                        fit: BoxFit.contain,
                      ),
                      title: Text(widget.item.name),
                      subtitle: const Text(
                          'Product description to be displayed here'),
                    ),
                  ),
                ],
              ),
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
                      onPressed: () =>
                          setState(() => buttonState = !buttonState),
                      icon: buttonState
                          ? const Icon(
                              Icons.bookmark,
                              color: Colors.grey,
                            )
                          : const Icon(
                              Icons.bookmark_border,
                              color: Colors.grey,
                            ),
                      color: Colors.white,
                      label: buttonState
                          ? const Text('Move To Cart')
                          : const Text('Save for Later'),
                    ),
                  ),
                  Expanded(
                    child: RaisedButton.icon(
                      onPressed: () => openDeleteItem(context, widget.item),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.grey,
                      ),
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
