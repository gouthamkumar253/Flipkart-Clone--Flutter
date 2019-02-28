import 'package:swipedetector/swipedetector.dart';
import 'package:flutter/material.dart';
int photoIndex = 0;

class SimilarProducts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  void _nextImage() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : 0;
      //print(photoIndex);
      //print(time.toString());
    });
  }
  void _previousImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : photos.length-1;
      //print(photoIndex);
      //print(time.toString());
    });
  }


// ignore: avoid_unused_constructor_parameter
  List<String> photos = <String>[
    'images/dwn4.jpg',
    'images/shoe.jpg',
    'images/dwn4.jpg',
    'images/shoe.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SwipeDetector(
      onSwipeLeft: (){
        _nextImage();
      },
      onSwipeRight: (){
        _previousImage();
      },
      child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                    // you may want to use an aspect ratio here for tablet support
                    height: 450.0,
                    child: PageView.builder(
                      // store this controller in a State to save the carousel scroll position
                      controller: PageController(),
                      itemBuilder: (BuildContext context, int itemIndex) {
                        return _buildPageItem(context, itemIndex);
                      },
                      itemCount: photos.length,
                    ),

                  ),

                  Positioned(
                    top: 400.0,
                    left: 25.0,
                    right: 25.0,
                    child: SelectedPhoto(
                        numberOfDots: photos.length, photoIndex: photoIndex),
                  )
                ],
              ),
              const SizedBox(height: 50.0),
            ],
          )),
    );
  }
  Widget _buildPageItem(BuildContext context, int itemIndex) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(photos[itemIndex]),
              fit: BoxFit.fill),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),

    );
  }
}


class SelectedPhoto extends StatelessWidget {
  const SelectedPhoto({this.numberOfDots, this.photoIndex});

  final int numberOfDots;
  final int photoIndex;

  Widget _inactivePhoto() {
    return Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 3.0, right: 3.0),
          child: Container(
            height: 8.0,
            width: 8.0,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(4.0)),
          ),
        ));
  }

  Widget _activePhoto() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Colors.grey, spreadRadius: 0.0, blurRadius: 2.0)
              ]),
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    final List<Widget> dots = <Widget>[];

    for (int i = 0; i < numberOfDots; ++i) {
      dots.add(i == photoIndex ? _activePhoto() : _inactivePhoto());
    }

    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }
}
