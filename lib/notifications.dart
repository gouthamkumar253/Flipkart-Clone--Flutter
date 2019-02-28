//import 'package:ecommerce/cart_list.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO(username): implement build
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
              'Notifications'
          ),

        ),
          body: const Text('You will be notified if it is important'),
      ),
    );
  }
}
