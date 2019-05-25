import 'package:ecommerce/models/list_items.dart';
import 'package:ecommerce/models/products.dart';

import 'actions.dart';

Products productsReducer(Products product, dynamic action) {
  if (action is AddItemToCartAction) {
    print('Add Item To Cart Action');
    addItems(product, action);
  } else if (action is DeleteItemFromCartAction) {
    deleteItems(product, action);
  } else if (action is AddItemToListAction) {
    addItemsList(product, action);
  } else if (action is DeleteItemFromListAction) {
    deleteItemsList(product, action);
  } else if (action is GenerateListAction) {
    print('Generate List Action');
    generateItemsList(product, action);
  } else if (action is AddItemToWishListAction) {
    addItemsWishList(product, action);
  } else if (action is DeleteItemFromWishListAction) {
    deleteItemsWishList(product, action);
  }
  return product;
}

Products addItemsWishList(Products product, AddItemToWishListAction action) {
  int flag = 0;
  print(action.item.id);

  for (ListItems item in product.wishListItems)
    if (item.id == action.item.id) {
      item.quantity++;
      flag = 1;
      print('quantity incremented in wishlist');
    }
  if (flag == 0) {
    product.wishListItems.add(action.item);
    print('Item Added to wishlist');
  }
  print(product.wishListItems.length);
  return product;
}

Products deleteItemsWishList(
    Products product, DeleteItemFromWishListAction action) {
  final ListItems item=product.listItems.firstWhere((ListItems item)=>item.id==action.item.id);
  item.wishList=false;
  print(action.item.id.toString()+'---has been deleted and wishlist changed to '+item.wishList.toString());
  product.wishListItems
      .removeWhere((ListItems item) => item.id == action.item.id);
  return product;
}

Products generateItemsList(Products product, GenerateListAction action) {
  print('This is the reducer');
  const int id = 1;
  //print('Initial list length'+product.listItems.length.toString()+'action'+action.itemList.length.toString());
  // ignore: prefer_foreach

  product.listItems = action.itemList;
  for (ListItems item in action.itemList)
  // ignore: prefer_foreach
  {
    print(item.name + '---' + (id + 1).toString() + '---' + item.image);
  }
  print('Final list length' +
      product.listItems.length.toString() +
      'action' +
      action.itemList.length.toString());
  return product;
}

Products addItems(Products product, AddItemToCartAction action) {
  int flag = 0;
  print(action.item.id);

  for (ListItems item in product.cartItems)
    if (item.id == action.item.id) {
      item.quantity++;
      flag = 1;
      print('quantity incremented');
    }
  if (flag == 0) {
    product.cartItems.add(action.item);
    print('Item Added');
  }
  //final List<CartItems> addedList=List<CartItems>.from(items)..add(action.item);
  print(product.cartItems.length);
  return product;
}

Products deleteItems(Products product, DeleteItemFromCartAction action) {
  print(action.item.id);
  product.cartItems.removeWhere((ListItems item) => item.id == action.item.id);
  return product;
}

Products addItemsList(Products product, AddItemToListAction action) {
  int flag = 0;
  print(action.item.id);
  for (ListItems item in product.listItems)
    if (item.id == action.item.id) {
      item.quantity++;
      flag = 1;
      print('quantity incremented');
    }
  if (flag == 0) {
    product.listItems.add(action.item);
    print('Item Added');
  }
  //final List<CartItems> addedList=List<CartItems>.from(items)..add(action.item);
  print(product.listItems.first.name);
  print(product.listItems.length);
  return product;
}

Products deleteItemsList(Products product, DeleteItemFromListAction action) {
  print(action.item.id);
  product.listItems.removeWhere((ListItems item) => item.id == action.item.id);
  return product;
}
