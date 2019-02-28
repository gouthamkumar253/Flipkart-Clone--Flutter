import 'package:ecommerce/models/list_items.dart';
import 'package:ecommerce/product_images.dart';
import 'package:flutter/material.dart';

class ProductDetailHeader extends StatelessWidget {
  const ProductDetailHeader(this.item);

  final ListItems item;

  @override
  Widget build(BuildContext context) {
    //final TextTheme textTheme = Theme.of(context).textTheme;

    final Column productInformation = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Brand Name',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11.0, color: Colors.grey),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          item.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontWeight: FontWeight.bold,fontSize: 14.0, color: Colors.black),
        ),
        const SizedBox(
          height: 5.0,
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
        Row(
          children: <Widget>[
            Container(
              height: 20.0,
              width: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.green,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 3.0),
                child: Stack(
                  children: const <Widget>[
                    Text(
                      '4.5',
                      style: TextStyle(color: Colors.white,fontSize:12.0),
                    ),
                    Positioned(
                      right: 5.0,
                      bottom: 3.0,
                      child: Icon(
                        Icons.star,
                        size: 15.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            const Text('25 ratings'),
          ],
        )
      ],
    );

    return Card(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: ProductImages(),
          ),
          Positioned(
            bottom: 5.0,
            left: 5.0,
            right: 16.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(width: 10.0),
                Expanded(child: productInformation),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
