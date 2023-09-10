import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:provider/provider.dart';

import '/inner_screens/product_details.dart';
import '/models/product.dart';
import '/provider/cart_provider.dart';
import '/provider/favs_provider.dart';

class PopularProducts extends StatelessWidget {
  //const PopularProducts({Key? key, required this.imageUrl, required this.title, required this.description, required this.price}) : super(key: key);

  //ovie gi stavam tuka za da gi popolnam i da gi prikazam na home page kako popular products
  //gi prakjam kako argument vo konstruktor od home.dart
  /*  final String imageUrl;
   final String title;
   final String description;
   final double price;*/

  @override
  Widget build(BuildContext context) {
    final productsAttributes = Provider.of<Product>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final favsProvider = Provider.of<FavsProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0)),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0)),
            onTap: () => Navigator.pushNamed(context, ProductDetails.routeName,
                arguments: productsAttributes.id),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 170,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(productsAttributes.imageUrl),
                        fit: BoxFit.cover,
                      )),
                    ),
                    Positioned(
                      right: 10,
                      top: 8,
                      child: Icon(
                        Entypo.star_outlined,
                        color: favsProvider.getFavsItems
                                .containsKey(productsAttributes.id)
                            ? Colors.red
                            : Colors.grey.shade800,
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 8,
                      child: Icon(
                        Entypo.star,
                        color: favsProvider.getFavsItems
                                .containsKey(productsAttributes.id)
                            ? Colors.red
                            : Colors.grey.shade800,
                      ),
                    ),
                    Positioned(
                      right: 12,
                      bottom: 32.0,
                      child: Container(
                          padding: const EdgeInsets.all(10.0),
                          color: Theme.of(context).backgroundColor,
                          child: Text(
                            '\$ ${productsAttributes.price}',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .textSelectionTheme
                                    .selectionColor),
                          )),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productsAttributes.title,
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Text(
                              productsAttributes.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade800),
                            ),
                          ),
                          const Spacer(),
                          Expanded(
                            flex: 1,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                  onTap: cartProvider.getCartItems
                                          .containsKey(productsAttributes.id)
                                      ? () {}
                                      : () {
                                          cartProvider.addProductToCart(
                                              productsAttributes.id,
                                              productsAttributes.price,
                                              productsAttributes.title,
                                              productsAttributes.imageUrl);
                                        },
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      //ako e vekje dodaden ne ja pokazuvaj kosnickata tuku druga ikona
                                      cartProvider.getCartItems.containsKey(
                                              productsAttributes.id)
                                          ? MaterialCommunityIcons.check_all
                                          : MaterialCommunityIcons.cart_plus,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
