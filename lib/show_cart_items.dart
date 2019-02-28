import 'package:ecommerce/cart_list.dart';
import 'package:flutter/material.dart';

class ShowCartItems extends StatelessWidget {
//  @override
//  _ShowCartItems createState() => _ShowCartItems();
//}
//
//class _ShowCartItems extends State<ShowCartItems> {
  @override
  Widget build(BuildContext context) {
    // TODO(username): implement build
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
              'My Cart'
          ),
        ),

        body: CartList(),
      ),
    );
  }
}
