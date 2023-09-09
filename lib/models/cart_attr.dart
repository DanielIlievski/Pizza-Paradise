import 'package:flutter/material.dart';


//i za ovaa klasa imame implementirano provider
//kako i kaj products
class CartAttr with ChangeNotifier{

  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;

  CartAttr({required this.id, required this.title, required this.quantity, required this.price, required this.imageUrl});


}