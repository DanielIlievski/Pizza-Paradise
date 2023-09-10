import 'package:flutter/material.dart';

import '/models/product.dart';
import '/provider/products.dart';
import '/widgets/feeds_products.dart';
import 'package:provider/provider.dart';

class CategoriesFeedScreen extends StatelessWidget {

  static const routeName = '/CategoriesFeedScreen';

  @override
  Widget build(BuildContext context) {

    final productsProvider = Provider.of<Products>(context, listen: false);
    //vo categoryName go zemame imeto na kategorijata od category.dart navigatorot
    //ovoj !. pred settings e null-check
    final categoryName = ModalRoute.of(context)!.settings.arguments as String;
    //sega treba da gi zemime site produkti sto spagjaat vo taa kategorija
    //da ne go pravime toa tuka, ke go napravime vo Providerot => products.dart

    final List<Product> productsList = productsProvider.findByCategory(categoryName);
    return Scaffold( // we use Scaffold because we want to return a screen
        body:
        GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240/420 ,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: List.generate (productsList.length, (index){
            return ChangeNotifierProvider.value(
              value: productsList[index],
              child: FeedProducts(),
            );
          }
          ),
        )
    );
  }
}