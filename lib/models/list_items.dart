import 'package:meta/meta.dart';

class ListItems {
  ListItems({@required this.name, @required this.id, @required this.quantity, @required this.image});

  String name;
  int id;
  int quantity;
  bool wishList;
  String image;

}