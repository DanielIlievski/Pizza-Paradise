import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';

import '/inner_screens/product_details.dart';
import '/models/product.dart';


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
        onTap: () => Navigator.pushNamed(context, ProductDetails.routeName,arguments: productsAttributes.id),
        child: Container(
            width: 250,
            height: 290,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Theme.of(context).backgroundColor),
            child: Column(
              children: [
                Stack(
                  children: [


                    ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: Container(
                        width: double.infinity,
                        //namesto HEIGHT, mozeme da mu naznacime constraints (minimum 100, maximum visinata * 0.2
                        constraints: BoxConstraints(minHeight: 100,maxHeight: MediaQuery.of(context).size.height*0.3),
                        child: Image.network('https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimagesvc.meredithcorp.io%2Fv3%2Fmm%2Fimage%3Furl%3Dhttps%253A%252F%252Fstatic.onecms.io%252Fwp-content%252Fuploads%252Fsites%252F9%252F2021%252F06%252F15%252Fmozzarella-pizza-margherita-FT-RECIPE0621.jpg&q=85',fit: BoxFit.fitWidth),
                      ),
                    ),
                    //badge NEW gore levo
                    Positioned(
                      //ako sakame da go shetame ovoj Badge 'New' levo desno gore dolu
                      //morame da go imame vo widget Positioned
                      //primer vaka:
                      //bottom: 0,
                      //right: 0,    ovie dve ke go staet desno dolu
                      child: Badge(
                        toAnimate: true,
                        shape: BadgeShape.square,
                        badgeColor: Colors.pink,
                        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(8)),
                        badgeContent: const Text('NEW', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left:5),
                  margin: const EdgeInsets.only(left:5, bottom:2,right:3),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4,),
                      Text(
                        productsAttributes.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines:1 ,
                        style: const TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          '\$ ${productsAttributes.price}',
                          overflow: TextOverflow.ellipsis,
                          maxLines:2 ,
                          style: const TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w900),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${productsAttributes.quantity}',
                            style: const TextStyle(fontSize: 12,color: Colors.grey,fontWeight: FontWeight.w600),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: (){},
                              borderRadius: BorderRadius.circular(18),
                              child: const Icon(
                                Icons.more_horiz,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],),
                ),

              ],
            )
        ),
      ),
    );
  }
}
