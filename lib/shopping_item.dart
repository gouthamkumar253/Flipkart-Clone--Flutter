//import 'package:ecommerce/delete_item_dialog.dart';
//import 'package:ecart_redux/models/cart_items.dart';
import 'package:ecommerce/add_item_dialog.dart';
import 'package:ecommerce/models/list_items.dart';
import 'package:ecommerce/product_details.dart';
import 'package:flutter/material.dart';

void openAddItem(BuildContext context, ListItems item) {
  showDialog<Widget>(
      context: context,
      builder: (BuildContext context) => AddItemDialog(item: item));
}

class ShoppingItem extends StatefulWidget {
  const ShoppingItem({Key key, this.item}) : super(key: key);
  final ListItems item;
  @override
  State<StatefulWidget> createState() => _ShoppingItem();
}

class _ShoppingItem extends State<ShoppingItem> {
  Icon icon = const Icon(Icons.favorite_border);
  bool iconstate;

  @override
  void initState() {
    super.initState();
    iconstate = false;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        Navigator.of(context).push(
          //ignore: strong_mode_implicit_dynamic_type
            MaterialPageRoute<BuildContext>(
                builder: (BuildContext context) =>
                    ProductDetails(widget.item)));
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 8.0,
            ),
            Center(
              child: Container(
                decoration: const BoxDecoration(

                  image: DecorationImage(
                    image: AssetImage('images/shoe1.png'),
                    fit: BoxFit.fill,
                  ),
                  //color: Colors.blue,
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      right: 0.0,
                      top: 0.0,
                      child: IconButton(
                        icon: iconstate
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_border),
                        color: iconstate? Colors.red : Colors.blue,
                        iconSize: 30.0,
                        onPressed: () =>setState(() {
                              iconstate = !iconstate;
                            }),
                      ),
                    ),
                  ],
                ),
                height: 200.0,
                width: MediaQuery.of(context).size.width / 2,
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
                    style:  TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                   Text(
                    widget.item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Text(
                        '\u20B950',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0, color: Colors.black),
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
                        style: TextStyle(fontSize: 14.0, color: Colors.deepOrange),
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
    );
  }
}
