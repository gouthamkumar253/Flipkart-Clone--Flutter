import 'package:ecommerce/create_item_dialog.dart';
import 'package:ecommerce/data_search.dart';
import 'package:ecommerce/generate_items.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/notifications.dart';
import 'package:ecommerce/shopping_list.dart';
import 'package:ecommerce/show_cart_items.dart';
import 'package:ecommerce/show_wishlist_items.dart';
import 'package:ecommerce/user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key key, this.store}) : super(key: key);
  final Store<Products> store;

  @override
  State<StatefulWidget> createState() => _ShoppingCart();
}

class _ShoppingCart extends State<ShoppingCart> {
  void openCreateItem(BuildContext context) {
    showDialog<Widget>(
        context: context,
        builder: (BuildContext context) => CreateItemDialog());
  }

  void openGenerateItems(BuildContext context) {
    showDialog<Widget>(
        context: context,
        builder: (BuildContext context) => GenerateItemDialog());
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<Products, Products>(
        converter: (Store<Products> store) => widget.store.state,
        builder: (BuildContext context, Products product) {
          return Scaffold(
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container(
                    height: 100.0,
                    child: const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Text(
                        'Options',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Add Item to List'),
                    onTap: () {
                      Navigator.of(context).pop();
                      openCreateItem(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Generate Products List'),
                    onTap: () {
                      Navigator.of(context).pop();
                      //GenerateItem();
                      openGenerateItems(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Wishlist items'),
                    onTap: () {
                      //ignore: strong_mode_implicit_dynamic_method
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        //ignore: strong_mode_implicit_dynamic_type
                        MaterialPageRoute<BuildContext>(
                          builder: (BuildContext context) =>
                              ShowWishListItems(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('User Information'),
                    onTap: () {
                      //ignore: strong_mode_implicit_dynamic_method
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        //ignore: strong_mode_implicit_dynamic_type
                        MaterialPageRoute<BuildContext>(
                          builder: (BuildContext context) =>
                              UserInfo(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              title: const Text('E-Cart'),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 150.0,
                    width: 30.0,
                    child: IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: DataSearch(product.listItems),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 150.0,
                    width: 30.0,
                    child: GestureDetector(
                      onTap: () {
                        //ignore: strong_mode_implicit_dynamic_method
                        Navigator.of(context).push(
                            //ignore: strong_mode_implicit_dynamic_type
                            MaterialPageRoute<BuildContext>(
                                builder: (BuildContext context) =>
                                    Notifications()));
                      },
                      child: const IconButton(
                        icon: Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 150.0,
                    width: 40.0,
                    child: GestureDetector(
                      onTap: () {
                        //ignore: strong_mode_implicit_dynamic_method
                        Navigator.of(context).push(
                            //ignore: strong_mode_implicit_dynamic_type
                            MaterialPageRoute<BuildContext>(
                                builder: (BuildContext context) =>
                                    ShowCartItems()));
                      },
                      child: Stack(
                        children: <Widget>[
                          const IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                            onPressed: null,
                          ),
                          product.cartItems.isEmpty
                              ? Container()
                              : Positioned(
                                  left: 15.0,
                                  child: Stack(
                                    children: <Widget>[
                                      const Icon(
                                        Icons.brightness_1,
                                        size: 20.0,
                                        color: Colors.red,
                                      ),
                                      Positioned(
                                        top: 4.2,
                                        right: 5.8,
                                        child: Text(
                                          product.cartItems.length.toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            body: ShoppingList(),
//            floatingActionButton: FloatingActionButton(
//              onPressed: () => openCreateItem(context),
//              child: const Icon(Icons.add),
//            ),
          );
        });
  }
}
