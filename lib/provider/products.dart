import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/models/product.dart';

class Products with ChangeNotifier {

  //lista koja ja polnam od baza
  List<Product> _products = [];

  // GET ALL PRODUCTS FROM FIRESTORE COLLECTION 'products'
  Future<void> FetchProducts()async {

    await FirebaseFirestore.instance
        .collection('products')
        .get()
        .then((QuerySnapshot productsSnapshot) {
      _products = [];
      productsSnapshot.docs.forEach((element) {
        //for each element in firestore collection products add to the products list above
        _products.insert(0, Product(
            id:element.get('productId'),
            title: element.get('productTitle'),
            description: element.get('productDescription'),
            price: double.parse(element.get('price')),
            imageUrl: element.get('productImage'),
            productCategoryName: element.get('productCategory'),
            quantity: int.parse(element.get('productQuantity')),
            isFavorite: false,
            isPopular: true));
      });
    });
  }
  List<Product> get products{
    return _products;
  }



  //get all products for a given categoryName
  List<Product> findByCategory(String categoryName) {
    List<Product> _categoryList = _products
        .where((element) => element.productCategoryName
        .toLowerCase()
        .contains(categoryName.toLowerCase()))
        .toList();
    return _categoryList;
  }

  //get popular products based on attribute isPopular
  List<Product> get popularProducts{
    return _products.where((element) => element.isPopular).toList();
  }

  //find  by ID
  Product findById(String productId){
    return _products.firstWhere((element) => element.id == productId);
  }

  List<Product> searchQuery(String searchText) {
    return _products
        .where((element) =>
        element.title.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }
}


  // //privremena baza na produkti
  // final List<Product> _products = [
  //   Product(
  //       id:'Product1',
  //       title: 'pizza1',
  //       description: 'mnogu uba pizzaaaaaaaaaaa',
  //       price: 23.99,
  //       imageUrl:'https://i1.wp.com/www.puntarellarossa.it/wp/wp-content/uploads/2021/01/dominos-pizza-roma.jpg?fit=1053%2C749&ssl=1',
  //       productCategoryName: 'Pizza',
  //       quantity: 10,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id:'Product2',
  //       title: 'pizza2',
  //       description: 'mnogu uba pizzaaaaaaaaaaa',
  //       price: 23.99,
  //       imageUrl:'https://i1.wp.com/www.puntarellarossa.it/wp/wp-content/uploads/2021/01/dominos-pizza-roma.jpg?fit=1053%2C749&ssl=1',
  //       productCategoryName: 'Pizza',
  //       quantity: 12,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id:'Product3',
  //       title: 'pizza3',
  //       description: 'mnogu uba pizzaaaaaaaaaaa',
  //       price: 23.99,
  //       imageUrl:'https://i1.wp.com/www.puntarellarossa.it/wp/wp-content/uploads/2021/01/dominos-pizza-roma.jpg?fit=1053%2C749&ssl=1',
  //       productCategoryName: 'Pizza',
  //       quantity: 12,
  //       isFavorite: false,
  //       isPopular: false),
  //   Product(
  //       id:'Product4',
  //       title: 'pizza4',
  //       description: 'mnogu uba pizzaaaaaaaaaaa',
  //       price: 23.99,
  //       imageUrl:'https://i1.wp.com/www.puntarellarossa.it/wp/wp-content/uploads/2021/01/dominos-pizza-roma.jpg?fit=1053%2C749&ssl=1',
  //       productCategoryName: 'Pizza',
  //       quantity: 12,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id:'Product5',
  //       title: 'pizza5',
  //       description: 'macaroni',
  //       price: 23.99,
  //       imageUrl:'https://i1.wp.com/www.puntarellarossa.it/wp/wp-content/uploads/2021/01/dominos-pizza-roma.jpg?fit=1053%2C749&ssl=1',
  //       productCategoryName: 'Pasta',
  //       quantity: 12,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id:'Product6',
  //       title: 'pasta2',
  //       description: 'spageti',
  //       price: 23.99,
  //       imageUrl:'https://i1.wp.com/www.puntarellarossa.it/wp/wp-content/uploads/2021/01/dominos-pizza-roma.jpg?fit=1053%2C749&ssl=1',
  //       productCategoryName: 'Pasta',
  //       quantity: 12,
  //       isFavorite: false,
  //       isPopular: true),
  //   Product(
  //       id:'Product7',
  //       title: 'pastrmajlija1',
  //       description: 'Pastrmajlija',
  //       price: 23.99,
  //       imageUrl:'https://i1.wp.com/www.puntarellarossa.it/wp/wp-content/uploads/2021/01/dominos-pizza-roma.jpg?fit=1053%2C749&ssl=1',
  //       productCategoryName: 'Pastrmajlija',
  //       quantity: 12,
  //       isFavorite: false,
  //       isPopular: true),
  // ];