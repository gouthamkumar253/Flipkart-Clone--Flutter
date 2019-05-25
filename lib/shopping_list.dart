import 'package:ecommerce/carousel.dart';
import 'package:ecommerce/generate_items.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/shopping_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*24 is for notification bar on Android*/

    return StoreConnector<Products, Products>(
        converter: (Store<Products> store) => store.state,
        builder: (BuildContext context, Products product) =>
            SingleChildScrollView(
              primary: true,
              child: Column(
                children: <Widget>[
                  Carousel(),
                  GenerateItemDialog(),
                  GridView.builder(
                    itemCount: product.listItems.length,
                    //physics: ScrollPhysics(),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.5818181818181819),
                    itemBuilder: (BuildContext context, int index) =>
                        ShoppingItem(item: product.listItems[index]),
                  ),
                ],
              ),
            )
//          ListView(
//            children: <Widget>[
//              Carousel(),
//              GridView.builder(
//                itemCount: product.listItems.length,
//                shrinkWrap: true,
//                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                    crossAxisCount: 2, childAspectRatio: 0.5818181818181819),
//                itemBuilder: (BuildContext context, int index) =>
//                    ShoppingItem(item: product.listItems[index]),
//              ),
//            ],
//          ),

//          GridView.count(
//        scrollDirection: Axis.vertical,
//            crossAxisCount: 2,
//            children: <Widget>[
//              ListView.builder(
//                itemBuilder: (BuildContext context, int i) =>
//                    ShoppingItem(item: product.listItems[i]),
//                itemCount: product.listItems.length,
//              )
//            ],
//          ),
        );
  }
}
