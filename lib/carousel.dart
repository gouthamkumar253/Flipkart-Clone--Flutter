import 'dart:async';
import 'package:swipedetector/swipedetector.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
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

  Timer t,time;

  @override
  void initState() {
    super.initState();
    const Duration oneSec = Duration(seconds: 4);
    time=Timer.periodic(oneSec, (Timer t) => _nextImage());
  }

  int photoIndex = 0;

// ignore: avoid_unused_constructor_parameter
  List<String> photos = <String>[
    'images/shoe1.png',
    'images/shoe2.png',
    'images/shoe3.png',
    'images/shoe4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SwipeDetector(
      onSwipeLeft: (){
        time.isActive?time.cancel():null;
        _nextImage();
      },
      onSwipeRight: (){
        time.isActive?time.cancel():null;
        _previousImage();
      },
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(25.0),
                    image: DecorationImage(
                        image: AssetImage(photos[photoIndex]),
                        fit: BoxFit.fill)),
                height: 200.0,
              ),
              Positioned(
                top: 175.0,
                left: 25.0,
                right: 25.0,
                child: SelectedPhoto(
                    numberOfDots: photos.length, photoIndex: photoIndex),
              )
            ],
          ),
        ],
      )),
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
          width: 13.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7.0),
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
