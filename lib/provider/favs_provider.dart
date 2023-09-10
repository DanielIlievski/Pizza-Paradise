import 'package:flutter/cupertino.dart';
import '/models/favs_attr.dart';

class FavsProvider with ChangeNotifier{

  //za sega ovaa mapa e  prazna
  Map<String, FavsAttr> _favsItems = {};


  Map<String, FavsAttr> get getFavsItems{
    return _favsItems;
  }

  //allow users to add products to their cart
  void addAndRmoveFromFav(String productId, double price, String title ,String imageUrl){

    //first check if the product is already added
    //if it is quantity++, if not add the product
    if(_favsItems.containsKey(productId)){
      removeItem(productId);
    }
    else{
      //add new item
      _favsItems.putIfAbsent(productId,
              () => FavsAttr(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              imageUrl: imageUrl));
    }
    notifyListeners();
  }

  //remove from cart
  void removeItem(String productId){
    _favsItems.remove(productId);
    notifyListeners();
  }

  //clear cart
  void clearFavs(){
    _favsItems.clear();
    notifyListeners();
  }

}