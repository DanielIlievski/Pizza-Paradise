import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

import '/models/product.dart';
import '/widgets/feeds_products.dart';
import '/provider/products.dart';
import '/consts/colors.dart';
import '/consts/my_icons.dart';
import '/provider/cart_provider.dart';
import '/provider/favs_provider.dart';
import '/screens/wishlist.dart';
import '/screens/cart.dart';

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
        appBar: AppBar(
          backgroundColor: Theme.of(context).cardColor,
          title: const Text(
            'Feeds',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Consumer<FavsProvider>(
              builder: (_, favs, ch) => badges.Badge(
                badgeStyle: badges.BadgeStyle(
                  badgeColor: ColorsConsts.cartBadgeColor
                ),
                badgeAnimation: const badges.BadgeAnimation.slide(),
                position: badges.BadgePosition.topEnd(top: 5, end: 7),
                badgeContent: Text(
                  favs.getFavsItems.length.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: IconButton(
                  icon: Icon(
                    MyAppIcons.wishlist,
                    color: ColorsConsts.favColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(WishlistScreen.routeName);
                  },
                ),
              ),
            ),
            Consumer<CartProvider>(
              builder: (_, cart, ch) => badges.Badge(
                badgeStyle: badges.BadgeStyle(
                  badgeColor: ColorsConsts.cartBadgeColor,
                ),
                badgeAnimation: const badges.BadgeAnimation.slide(),
                position: badges.BadgePosition.topEnd(top: 5, end: 7),
                badgeContent: Text(
                  cart.getCartItems.length.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: IconButton(
                  icon: Icon(
                    MyAppIcons.cart,
                    color: ColorsConsts.cartColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                ),
              ),
            ),
          ],
        ),
        body: GridView.count(
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
