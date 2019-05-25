import 'dart:async';

import 'package:flutter/material.dart';

int checkIndex = 0;

class Carousel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final PageController _controller = PageController(viewportFraction: 0.95);
  Duration seconds = const Duration(seconds: 3);

  void _nextImage() {
    setState(
      () {
        photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : 0;
        _controller.nextPage(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastOutSlowIn);
      },
    );
  }

  Timer time;

  @override
  void initState() {
    super.initState();
    const Duration sec = Duration(seconds: 4);
    time = Timer.periodic(sec, (Timer t) => _nextImage());
  }

  int photoIndex = 0;

// ignore: avoid_unused_constructor_parameter
  List<Widget> photos = <Widget>[
    Image.asset(
      'images/ad1.png',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'images/ad2.png',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'images/ad3.png',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'images/ad4.png',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'images/ad5.png',
      fit: BoxFit.fill,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.0,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (int index){
                    if(checkIndex%5!=photoIndex)
                      setState(() {
                        print('true');
                        time.cancel();
                      });
                    else
                      print('false');
                  },
                  itemBuilder: (BuildContext context, int itemIndex) {
                    checkIndex = itemIndex;
                    return Card(
                      elevation: 3.0,
                      child: photos[itemIndex % 5],
                    );
                  },
                ),
                height: 220.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
