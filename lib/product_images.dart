import 'package:flutter/material.dart';
List<String> photos = <String>[
  'images/shoe1.png',
  'images/shoe2.png',
  'images/shoe3.png',
  'images/shoe4.png',
];

class ProductImages extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int photoIndex = 0;
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.0,
//      width: ,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                height: 400.0,
                child: PageView.builder(
                  onPageChanged: (int index){
                    setState(() {
                      photoIndex=index;
                    });
                  },
                  controller: PageController(),
                  itemBuilder: (BuildContext context, int itemIndex) {
                    return _buildCarouselItem(context, itemIndex);
                  },
                  itemCount: 4,
                ),
              ),
              Positioned(
                top: 375.0,
                left: 25.0,
                right: 25.0,
                child: SelectedPhoto(numberOfDots: photos.length,photoIndex: photoIndex),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselItem(BuildContext context, int itemIndex) {

    print(itemIndex.toString() + '-----' + photoIndex.toString());
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(photos[photoIndex]), fit: BoxFit.fill),
      ),
    );
  }
}

class SelectedPhoto extends StatelessWidget {
  const SelectedPhoto({Key key, this.numberOfDots, this.photoIndex}) : super(key: key);
  final int numberOfDots;
  final int photoIndex;

  Widget _inactivePhoto() {
//    print(object)
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
              BoxShadow(color: Colors.grey, spreadRadius: 0.0, blurRadius: 2.0)
            ],
          ),
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
