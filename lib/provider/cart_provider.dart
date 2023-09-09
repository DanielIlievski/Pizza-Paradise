import 'package:flutter/cupertino.dart';
import '/models/cart_attr.dart';

class CartProvider with ChangeNotifier{

  //za sega ovaa mapa e  prazna
  final Map<String, CartAttr> _cartItems = {};


  Map<String,CartAttr> get getCartItems{
    return _cartItems;
  }

  //get total $$ of the products
  double get totalAmount{
    var total = 0.0;

    _cartItems
        .forEach((key, value) {total+= value.price* value.quantity;});

    return total;
  }

  //allow users to add products to their cart
  void addProductToCart(String productId, double price, String title ,String imageUrl){

    //first check if the product is already added
    //if it is quantity++, if not add the product
    if(_cartItems.containsKey(productId)){
      _cartItems.update(productId, (ExistingCartItem) => CartAttr(
          id: ExistingCartItem.id,
          title: ExistingCartItem.title,
          price: ExistingCartItem.price,
          quantity: ExistingCartItem.quantity + 1,
          imageUrl: ExistingCartItem.imageUrl));
    }
    else{
      //add new item
      _cartItems.putIfAbsent(productId,
              () => CartAttr(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: 1,
              imageUrl: imageUrl));
    }
    notifyListeners();
  }

  //reduce by 1, go koristime vo cart minus kopceto
  void reduceItemByOne(String productId){
    if(_cartItems.containsKey(productId)){
      _cartItems.update(productId, (ExistingCartItem) => CartAttr(
          id: ExistingCartItem.id,
          title: ExistingCartItem.title,
          price: ExistingCartItem.price,
          quantity: ExistingCartItem.quantity - 1,
          imageUrl: ExistingCartItem.imageUrl));
    }
    notifyListeners();
  }


  //remove from cart
  void removeItem(String productId){
    _cartItems.remove(productId);
    notifyListeners();
  }

  //clear cart
  void clearCart(){
    _cartItems.clear();
    notifyListeners();
  }

}