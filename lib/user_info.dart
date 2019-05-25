import 'dart:async';
import 'dart:convert';

import 'package:ecommerce/data_search.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/models/serializers.dart';
import 'package:ecommerce/models/user_profile.dart';
import 'package:ecommerce/show_cart_items.dart';
import 'package:ecommerce/show_wishlist_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final String url = 'https://swapi.co/api/people/1';
  Map<String, dynamic> data = <String, dynamic>{};
  BuiltUsers usersData;

  Future<void> getJsonData() async {
    final http.Response response = await http.get(Uri.encodeFull(url),
        headers: <String, String>{'Accept': 'application/json'});

    print('this is the response' + response.body);

    setState(
      () {
        usersData = serializers.deserializeWith(
            BuiltUsers.serializer, json.decode(response.body));
        print('this is the userdata' + usersData.toString());
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<Products, Products>(
      converter: (Store<Products> store) => store.state,
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
                    //openCreateItem(context);
                  },
                ),
                ListTile(
                  title: const Text('Generate Products List'),
                  onTap: () {
                    Navigator.of(context).pop();
                    //GenerateItem();
                    //openGenerateItems(context);
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
                        builder: (BuildContext context) => ShowWishListItems(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('User Information'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute<BuildContext>(
                        builder: (BuildContext context) => UserInfo(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          body: Container(
            //height: 1000,
            child: ListView(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    CustomScrollView(
                      shrinkWrap: true,
                      slivers: <Widget>[
                        SliverAppBar(
                          pinned: true,
                          title: const Text('My Account'),
                          expandedHeight: 225.0,
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
                                        delegate:
                                            DataSearch(product.listItems));
                                    print(product.listItems.length);
                                  },
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
                                                      product.cartItems.length
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11.0,
                                                          fontWeight:
                                                              FontWeight.w500),
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
                          flexibleSpace: FlexibleSpaceBar(
                            title: Padding(
                              padding: const EdgeInsets.only(left: 22.0),
                              child: FutureBuilder<dynamic>(
                                future:
                                    http.get('https://swapi.co/api/people/1'),
                                builder: (BuildContext context,
                                    AsyncSnapshot<dynamic> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    print('initial format of the model----');
                                    print(usersData);
                                    print('convert to json---');
                                    print(usersData.toJson());
                                    usersData.fromJson(
                                        usersData.toJson().toString());
                                    print('Converted from Json----');
                                    print(usersData);
                                    print(usersData.name +
                                        usersData.height +
                                        usersData.mass);
                                    return Text(
                                      usersData.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16.0),
                                    );
                                  } else {
                                    return const Padding(
                                      padding: EdgeInsets.only(left: 20.0),
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.blue,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            background: Container(
                              color: Colors.blue[700],
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Container(
                                    height: 75.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            const AssetImage('images/man.png'),
                                        fit: BoxFit.contain,
                                      ),
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 100,
                      child: Card(
                        child: Container(
                          child: Stack(
                            children: <Widget>[
                              const Positioned(
                                top: 10.0,
                                left: 10.0,
                                child: Text(
                                  'Flipkart Plus Zone',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ),
                              Positioned(
                                //top: 50.0,
                                child: Center(
                                  child: SizedBox(
                                    height: 0.5,
                                    width: 325.0,
                                    child: Container(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              const Positioned(
                                bottom: 10.0,
                                right: 20.0,
                                child: Text(
                                  'GO TO PLUS ZONE',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 16.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Card(
                        child: Container(
                          child: Stack(
                            children: <Widget>[
                              const Positioned(
                                top: 10.0,
                                left: 10.0,
                                child: Text(
                                  'My Orders',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ),
                              Positioned(
                                //top: 50.0,
                                child: Center(
                                  child: SizedBox(
                                    height: 0.5,
                                    width: 325.0,
                                    child: Container(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              const Positioned(
                                bottom: 10.0,
                                right: 20.0,
                                child: Text(
                                  'VIEW ALL ORDERS',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 16.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Card(
                        child: Container(
                          child: Stack(
                            children: <Widget>[
                              const Positioned(
                                top: 10.0,
                                left: 10.0,
                                child: Text(
                                  'My Wallet and Cards',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ),
                              Positioned(
                                //top: 50.0,
                                child: Center(
                                  child: SizedBox(
                                    height: 0.5,
                                    width: 325.0,
                                    child: Container(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              const Positioned(
                                bottom: 10.0,
                                right: 20.0,
                                child: Text(
                                  'VIEW DETAILS',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 16.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Card(
                        child: Container(
                          child: Stack(
                            children: <Widget>[
                              const Positioned(
                                top: 10.0,
                                left: 10.0,
                                child: Text(
                                  'My Reviews',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ),
                              Positioned(
                                //top: 50.0,
                                child: Center(
                                  child: SizedBox(
                                    height: 0.5,
                                    width: 325.0,
                                    child: Container(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              const Positioned(
                                bottom: 10.0,
                                right: 20.0,
                                child: Text(
                                  'VIEW YOUR REVIEWS',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 16.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      child: Card(
                        child: Container(
                          child: Stack(
                            children: <Widget>[
                              const Positioned(
                                top: 10.0,
                                left: 10.0,
                                child: Text(
                                  'My Questions & Answers',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ),
                              Positioned(
                                //top: 50.0,
                                child: Center(
                                  child: SizedBox(
                                    height: 0.5,
                                    width: 325.0,
                                    child: Container(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              const Positioned(
                                bottom: 10.0,
                                right: 20.0,
                                child: Text(
                                  'VIEW YOUR Q&A',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 16.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
