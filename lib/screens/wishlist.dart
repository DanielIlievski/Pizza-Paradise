import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/consts/my_icons.dart';
import '/widgets/wishlist_empty.dart';
import '/widgets/wishlist_full.dart';
import '/provider/favs_provider.dart';
import '/services/global_methods.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/WishlistScreen';

  @override
  Widget build(BuildContext context) {
    GlobalMethods globalMethods = GlobalMethods();
    final favsProvider = Provider.of<FavsProvider>(context);

    return favsProvider.getFavsItems.isEmpty
        ? Scaffold(body: WishlistEmpty())
        : Scaffold(
            appBar: AppBar(
              title: Text('Wishlist (${favsProvider.getFavsItems.length})'),
              actions: [
                IconButton(
                  onPressed: () {
                    globalMethods.showDialogg(
                        'Clear wishlist',
                        'Your wishlist will be cleared',
                        () => favsProvider.clearFavs(),
                        context);
                  },
                  icon: const Icon(
                    MyAppIcons.trash,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            body: ListView.builder(
              itemCount: favsProvider.getFavsItems.length,
              itemBuilder: (BuildContext ctx, int index) {
                return ChangeNotifierProvider.value(
                    value: favsProvider.getFavsItems.values.toList()[index],
                    child: WishlistFull(
                      productId: favsProvider.getFavsItems.keys.toList()[index],
                    ));
              },
            ),
          );
  }
}
