import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/consts/colors.dart';
import '/consts/my_icons.dart';
import '/widgets/cart_empty.dart';
import '/widgets/cart_full.dart';
import '/provider/cart_provider.dart';
import '/services/global_methods.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/CartScreen';

  @override
  Widget build(BuildContext context) {
    GlobalMethods globalMethods = GlobalMethods();

    //lista na produkti od korisnikot
    // List products = [];
    //ako ovaa lista na produkti od korisnikot e prazna, togas
    //prikazi ja CartEmpty(), ako e polna togas CartFull()

    //namesto ova gore, listata sto bese hard-coded ja smeniv so cartProvider

    //dependency injection na CartProvider kako so praevme kaj products
    final cartProvider = Provider.of<CartProvider>(context);

    return cartProvider.getCartItems.isEmpty
        ? Scaffold(
            body: CartEmpty(),
          )
        : Scaffold(
            bottomSheet: checkoutSection(context, cartProvider.totalAmount),
            appBar: AppBar(
              backgroundColor: Theme.of(context).backgroundColor,
              title: Text(
                'Cart (${cartProvider.getCartItems.length}) ',
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    globalMethods.showDialogg(
                        'Clear cart',
                        'Products from cart will be removed',
                        () => cartProvider.clearCart(),
                        context);
                  },
                  icon: Icon(
                    MyAppIcons.trash,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            body: Container(
              margin: EdgeInsets.only(bottom: 60),
              child: ListView.builder(
                  itemCount: cartProvider.getCartItems.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return ChangeNotifierProvider.value(
                      value: cartProvider.getCartItems.values.toList()[index],
                      child: CartFull(
                        //moram vaka  da go pustam tuka za da pristapam posle vo cart_full
                        //product_details so soodvetnovo id
                        productId:
                            cartProvider.getCartItems.keys.toList()[index],

                        //ke go koristime providerot pogore

                        //ova dolu e so dependency inejction (preku konstruktor)
                        /*  id: cartProvider.getCartItems.values.toList()[index].id,
                productId: cartProvider.getCartItems.keys.toList()[index],
                price: cartProvider.getCartItems.values.toList()[index].price,
                title: cartProvider.getCartItems.values.toList()[index].title,
                imageUrl: cartProvider.getCartItems.values.toList()[index].imageUrl,
                quantity: cartProvider.getCartItems.values.toList()[index].quantity,
           */
                      ),
                    );
                  }),
            ));
  }

  //vo ovoj widget, kako vtor argument go prakjam subtotal za da znaeme kolku e total price na cart
  Widget checkoutSection(BuildContext ctx, double subtotal) {
    return Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(colors: [
                      ColorsConsts.gradientLStart,
                      ColorsConsts.gradientLEnd,
                    ], stops: const [
                      0.0,
                      0.7
                    ]),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(30),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Checkout',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(ctx)
                                  .textSelectionTheme
                                  .selectionColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                'Total',
                //textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(ctx).textSelectionTheme.selectionColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              Text(
                'USD ${subtotal.toStringAsFixed(2)}',
                //textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
            ],
          ),
        ));
  }
}
