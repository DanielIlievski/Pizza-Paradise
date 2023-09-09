import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/provider/dark_theme_provider.dart';
import '/consts/colors.dart';
import '/consts/my_icons.dart';
import '/models/product.dart';
import '/screens/cart.dart';
import '/screens/wishlist.dart';
import '/widgets/feeds_products.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = '/ProductDetails';

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  GlobalKey previewContainer = new GlobalKey();

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
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            foregroundDecoration: const BoxDecoration(color: Colors.black12),
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            child: Image.network(
              'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimagesvc.meredithcorp.io%2Fv3%2Fmm%2Fimage%3Furl%3Dhttps%253A%252F%252Fstatic.onecms.io%252Fwp-content%252Fuploads%252Fsites%252F9%252F2021%252F06%252F15%252Fmozzarella-pizza-margherita-FT-RECIPE0621.jpg&q=85',
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.purple.shade200,
                          onTap: () {},
                          borderRadius: BorderRadius.circular(30),
                          child: const Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.save,
                              size: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.purple.shade200,
                          onTap: () {},
                          borderRadius: BorderRadius.circular(30),
                          child: const Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.share,
                              size: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  //padding: const EdgeInsets.all(16.0),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: const Text(
                                'title',
                                maxLines: 2,
                                style: TextStyle(
                                  // color: Theme.of(context).textSelectionColor,
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'US \$ 12 }',
                              style: TextStyle(
                                  color: themeState.darkTheme
                                      ? Theme.of(context).disabledColor
                                      : ColorsConsts.subTitle,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21.0),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 3.0),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'descriptionnnnn',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 21.0,
                            color: themeState.darkTheme
                                ? Theme.of(context).disabledColor
                                : ColorsConsts.subTitle,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      _details(themeState.darkTheme, 'Brand: ', 'Nesto'),
                      _details(themeState.darkTheme, 'Quantity: ', '10'),
                      _details(
                          themeState.darkTheme, 'Category: ', 'Kategorija'),
                      _details(
                          themeState.darkTheme, 'Popularity: ', 'very popular'),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                        height: 1,
                      ),

                      // const SizedBox(height: 15.0),
                      Container(
                        color: Theme.of(context).backgroundColor,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10.0),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'No reviews yet',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textSelectionTheme
                                        .selectionColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 21.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'Be the first review!',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20.0,
                                  color: themeState.darkTheme
                                      ? Theme.of(context).disabledColor
                                      : ColorsConsts.subTitle,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 70,
                            ),
                            const Divider(
                              thickness: 1,
                              color: Colors.grey,
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 15.0),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: const Text(
                    'Suggested products:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  width: double.infinity,
                  height: 340,
                  child: ListView.builder(
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext ctx, int index) {
                      return FeedProducts(
                        id: _products[index].id,
                        description: _products[index].description,
                        price: _products[index].price,
                        imageUrl: _products[index].imageUrl,
                        quantity: _products[index].quantity,
                        isFavorite: _products[index].isFavorite,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: const Text(
                  "DETAILS",
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      MyAppIcons.wishlist,
                      color: ColorsConsts.favColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(WishlistScreen.routeName);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      MyAppIcons.cart,
                      color: ColorsConsts.cartColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(CartScreen.routeName);
                    },
                  ),

                  /*Consumer<FavsProvider>(
                    builder: (_, favs, ch) => Badge(
                      badgeColor: ColorsConsts.cartBadgeColor,
                      animationType: BadgeAnimationType.slide,
                      toAnimate: true,
                      position: BadgePosition.topEnd(top: 5, end: 7),
                      badgeContent: Text(
                        favs.getFavsItems.length.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      child: IconButton(
                        icon: Icon(
                          MyAppIcons.wishlist,
                          color: ColorsConsts.favColor,
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(WishlistScreen.routeName);
                        },
                      ),
                    ),
                  ),*/
                  /*Consumer<CartProvider>(
                    builder: (_, cart, ch) => Badge(
                      badgeColor: ColorsConsts.cartBadgeColor,
                      animationType: BadgeAnimationType.slide,
                      toAnimate: true,
                      position: BadgePosition.topEnd(top: 5, end: 7),
                      badgeContent: Text(
                        cart.getCartItems.length.toString(),
                        style: TextStyle(color: Colors.white),
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
                  )*/
                ]),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Row(children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(side: BorderSide.none),
                          backgroundColor: Colors.redAccent.shade400,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      onPressed: () {},
                      child: Text(
                        'Add to Cart'.toUpperCase(),
                        style: const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(side: BorderSide.none),
                        backgroundColor: Theme.of(context).backgroundColor,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            'Buy now'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context)
                                    .textSelectionTheme
                                    .selectionColor),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.payment,
                            color: Colors.green.shade700,
                            size: 19,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: themeState.darkTheme
                        ? Theme.of(context).disabledColor
                        : ColorsConsts.subTitle,
                    height: 50,
                    child: InkWell(
                      splashColor: ColorsConsts.favColor,
                      onTap: () {},
                      child: const Center(
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ]))
        ],
      ),
    );
  }

  Widget _details(bool themeState, String title, String info) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
      child: Row(
        //  mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Theme.of(context).textSelectionTheme.selectionColor,
                fontWeight: FontWeight.w600,
                fontSize: 21.0),
          ),
          Text(
            info,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20.0,
              color: themeState
                  ? Theme.of(context).disabledColor
                  : ColorsConsts.subTitle,
            ),
          ),
        ],
      ),
    );
  }
}
