import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '/models/product.dart';
import '/widgets/feeds_products.dart';

class FeedScreen extends StatelessWidget {
  static const routeName = '/FeedScreen';

  //privremena baza na produkti
  final List<Product> _products = [
    Product(
        id: 'Product1',
        title: 'pizza1',
        description: 'mnogu uba pizzaaaaaaaaaaa',
        price: 23.99,
        imageUrl: 'url',
        productCategoryName: 'Pizza',
        quantity: 10,
        isFavorite: false,
        isPopular: false),
    Product(
        id: 'Product2',
        title: 'pizza2',
        description: 'mnogu uba pizzaaaaaaaaaaa',
        price: 23.99,
        imageUrl: 'url',
        productCategoryName: 'Pizza',
        quantity: 12,
        isFavorite: false,
        isPopular: false),
    Product(
        id: 'Product3',
        title: 'pizza3',
        description: 'mnogu uba pizzaaaaaaaaaaa',
        price: 23.99,
        imageUrl: 'url',
        productCategoryName: 'Pizza',
        quantity: 12,
        isFavorite: false,
        isPopular: false),
    Product(
        id: 'Product4',
        title: 'pizza4',
        description: 'mnogu uba pizzaaaaaaaaaaa',
        price: 23.99,
        imageUrl: 'url',
        productCategoryName: 'Pizza',
        quantity: 12,
        isFavorite: false,
        isPopular: false),
    Product(
        id: 'Product5',
        title: 'pizza5',
        description: 'mnogu uba pizzaaaaaaaaaaa',
        price: 23.99,
        imageUrl: 'url',
        productCategoryName: 'Pizza',
        quantity: 12,
        isFavorite: false,
        isPopular: false),
    Product(
        id: 'Product6',
        title: 'pizza6',
        description: 'mnogu uba pizzaaaaaaaaaaa',
        price: 23.99,
        imageUrl: 'url',
        productCategoryName: 'Pizza',
        quantity: 12,
        isFavorite: false,
        isPopular: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // we use Scaffold because we want to return a screen
        body:
            /*StaggeredGridView.countBuilder(
        crossAxisCount: 6,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) => FeedProducts(),
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(3, index.isEven ? 4 : 5),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 6.0,
      )*/
            GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 240 / 420,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: List.generate(_products.length, (index) {
        return FeedProducts(
          id: _products[index].id,
          description: _products[index].description,
          price: _products[index].price,
          imageUrl: _products[index].imageUrl,
          quantity: _products[index].quantity,
          isFavorite: _products[index].isFavorite,
        );
      }),
    ));
  }
}
