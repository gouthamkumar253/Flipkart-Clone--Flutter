import 'package:ecommerce/add_item_dialog.dart';
import 'package:ecommerce/description_text.dart';
import 'package:ecommerce/models/list_items.dart';
import 'package:ecommerce/product_detail_header.dart';
import 'package:ecommerce/show_cart_items.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails(this.item);

  final ListItems item;

  void openAddItem(BuildContext context, ListItems item) {
    showDialog<Widget>(
        context: context,
        builder: (BuildContext context) => AddItemDialog(item: item));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: ScrollController(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: const Text('Product Details'),
              pinned: false,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              //bottom: PreferredSize(child: Container(), preferredSize: null),
            ),
          ];
        },
        body: Container(
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[

                    ProductDetailHeader(item),

                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Card(
                        child: Stack(
                          children: <Widget>[
                            const Positioned(
                              top: 10.0,
                              left: 10.0,
                              bottom: 30.0,
                              child: Text(
                                'Product Description',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DescriptionTextWidget(),
                          ],
                        ),
                      ),
                    ),
                    //PhotoScroller(movie.photoUrls),
                    //SimilarProducts(),
                    const SizedBox(height: 50.0),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                height: 45.0,
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 15.0,
                        // has the effect of softening the shadow
                        spreadRadius: 1.0,
                        // has the effect of extending the shadow
                        offset: Offset(
                          10.0, // horizontal, move right 10
                          10.0, // vertical, move down 10
                        ),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            openAddItem(context, item);
                          },
                          color: Colors.white,
                          child: const Text('ADD TO CART'),
                        ),
                      ),
                      Expanded(
                        child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(
                                //ignore: strong_mode_implicit_dynamic_type
                                MaterialPageRoute<BuildContext>(
                                    builder: (BuildContext context) =>
                                        ShowCartItems()));
                          },
                          color: Colors.deepOrange,
                          child: const Text(
                            'BUY NOW',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
