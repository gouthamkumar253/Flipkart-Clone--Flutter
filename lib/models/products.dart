import 'package:ecommerce/models/list_items.dart';

typedef OnItemCreatedCallback = Function(Products product);

class Products {
  //Products({@required this.name, @required this.id});
  Products() {
    cartItems = <ListItems>[];
    listItems = <ListItems>[];
    wishListItems=<ListItems>[];
  }

  List<ListItems> listItems, cartItems,wishListItems;
}
