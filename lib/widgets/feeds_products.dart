import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

import '/inner_screens/product_details.dart';
import '/models/product.dart';
import '/widgets/feeds_dialog.dart';

class FeedProducts extends StatefulWidget {
  @override
  _FeedProductsState createState() => _FeedProductsState();
}

class _FeedProductsState extends State<FeedProducts> {
  @override
  Widget build(BuildContext context) {
    final productsAttributes = Provider.of<Product>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, ProductDetails.routeName,
            arguments: productsAttributes.id),
        child: Container(
          width: 250,
          height: 290,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Theme.of(context).backgroundColor),
          child: Column(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                              minHeight: 100,
                              maxHeight:
                                  MediaQuery.of(context).size.height * 0.3),
                          child: Image.network(
                            productsAttributes.imageUrl,
                            //   fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Positioned(
                        // bottom: 0,
                        // right: 5,
                        // top: 5,
                        child: badges.Badge(
                          badgeStyle: const badges.BadgeStyle(
                            shape: badges.BadgeShape.square,
                            badgeColor: Colors.pink,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(8)),
                          ),
                          position: badges.BadgePosition.center(),
                          badgeContent: const Text('New',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 5),
                margin: const EdgeInsets.only(left: 5, bottom: 2, right: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      productsAttributes.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        '\$ ${productsAttributes.price}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${productsAttributes.quantity}',
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                              onTap: () async {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        FeedDialog(
                                          productId: productsAttributes.id,
                                        ));
                              },
                              borderRadius: BorderRadius.circular(18.0),
                              child: const Icon(
                                Icons.more_horiz,
                                color: Colors.grey,
                              )),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
