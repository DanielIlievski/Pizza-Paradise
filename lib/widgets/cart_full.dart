import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import '/consts/colors.dart';
import '/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class CartFull extends StatefulWidget {
  const CartFull({Key? key}) : super(key: key);

  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      height: 145,
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16.0),
            topRight: Radius.circular(16.0)),
        color: Colors.red,
      ),
      child: Row(
        children: [
          //ovaj e za slikata
          Container(
            width: 130,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimagesvc.meredithcorp.io%2Fv3%2Fmm%2Fimage%3Furl%3Dhttps%253A%252F%252Fstatic.onecms.io%252Fwp-content%252Fuploads%252Fsites%252F9%252F2021%252F06%252F15%252Fmozzarella-pizza-margherita-FT-RECIPE0621.jpg&q=85'),
                  fit: BoxFit.fill,
                )),
          ),

          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Text(
                          'title',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          //splashColor: Colors.grey,
                          borderRadius: BorderRadius.circular(32.0),
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: 50,
                            child: const Icon(
                              Entypo.cross,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text('Price: '),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '450\$',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Sub Total: '),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '450\$',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: themeChange.darkTheme
                                ? Colors.brown.shade900
                                : Theme.of(context).accentColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Free shipping',
                          style: TextStyle(
                              color: themeChange.darkTheme
                                  ? Colors.brown.shade900
                                  : Theme.of(context).accentColor)
                      ),

                      const Spacer(),

                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          //splashColor: Colors.grey,
                          borderRadius: BorderRadius.circular(4.0),
                          onTap: (){},
                          child: Container(
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(
                                Entypo.minus,
                                color: Colors.red,
                                size: 20,),
                            ),
                          ),
                        ),
                      ),

                      Card(
                        elevation: 15,
                        child: Container(

                          width: MediaQuery.of(context).size.width*0.12,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(gradient: LinearGradient(colors: [
                            ColorsConsts.gradientLStart,
                            ColorsConsts.gradientLEnd,
                          ],
                              stops: const [0.0,0.7]),
                          ),
                          child: const Text('12', textAlign: TextAlign.center,),
                        ),

                      ),

                      Material(
                        color: Colors.transparent,

                        child: InkWell(
                          //splashColor: Colors.grey,
                          borderRadius: BorderRadius.circular(4.0),
                          onTap: (){},
                          child: Container(
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(
                                Entypo.plus,
                                color: Colors.green,
                                size: 20,),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
