import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            onTap: (){},

            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 170,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimagesvc.meredithcorp.io%2Fv3%2Fmm%2Fimage%3Furl%3Dhttps%253A%252F%252Fstatic.onecms.io%252Fwp-content%252Fuploads%252Fsites%252F9%252F2021%252F06%252F15%252Fmozzarella-pizza-margherita-FT-RECIPE0621.jpg&q=85'),
                            fit: BoxFit.fill,
                          )),
                    ),
                    Positioned(
                      right: 12,
                      top: 10,
                      child: Icon(
                        Entypo.star_outlined,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    const Positioned(
                      right: 10,
                      top: 7,
                      child: Icon(
                        Entypo.star,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      right: 12,
                      bottom: 32.0,
                      child: Container(
                          padding: const EdgeInsets.all(10.0),
                          color: Theme.of(context).backgroundColor,
                          child: Text(
                            '\$ 12.2',
                            style: TextStyle(
                                color: Theme.of(context).textSelectionTheme.selectionColor),
                          )),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Title',
                        maxLines: 1,
                        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),

                      Row(

                        children: [
                          Text(
                            'Description',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.grey.shade800),
                          ),
                          const Spacer(),

                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                                onTap: (){},
                                borderRadius: BorderRadius.circular(30.0),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    MaterialCommunityIcons.cart_plus,
                                    size:25,
                                    color: Colors.black,
                                  ),
                                )
                            ),
                          ),

                        ],)

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
