import 'package:ecommerce/models/list_items.dart';
class AddItemToCartAction{
  AddItemToCartAction({this.item});
  final ListItems item;
}
class GenerateListAction{
  GenerateListAction({this.itemList});
  final List<ListItems> itemList;
}
class DeleteItemFromCartAction {
  DeleteItemFromCartAction(this.item);
  final ListItems item;
}
class AddItemToListAction{
  AddItemToListAction({this.item});
  final ListItems item;
}

class DeleteItemFromListAction {
  DeleteItemFromListAction(this.item);
  final ListItems item;
}