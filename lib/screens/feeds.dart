import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/product.dart';
import '/widgets/feeds_products.dart';
import '/provider/products.dart';

class FeedScreen extends StatelessWidget {
  static const routeName = '/FeedScreen';

  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final popular = ModalRoute.of(context)?.settings.arguments.toString();

    final productsProvider = Provider.of<Products>(context);
    List<Product> productsList = productsProvider.products;

    if (popular == 'popular') {
      productsList = productsProvider.popularProducts;
    }

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
      children: List.generate(productsList.length, (index) {
        return ChangeNotifierProvider.value(
          value: productsList[index],
          child: FeedProducts(),
        );
      }),
    ));
  }
}
