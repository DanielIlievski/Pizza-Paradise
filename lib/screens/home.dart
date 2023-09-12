import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '/consts/colors.dart';
import '/widgets/back_layer.dart';
import '/widgets/category.dart';
import '/widgets/popular_products.dart';
import '/provider/products.dart';
import '/screens/feeds.dart';

//we use Scaffold because we want to return a screen

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List _carouselImages = [
    'https://firebasestorage.googleapis.com/v0/b/pizza-paradise-eb3c1.appspot.com/o/carousel1.jpg?alt=media&token=4f57a033-2245-4c9d-9377-2adffc06d4c8',
    'https://firebasestorage.googleapis.com/v0/b/pizza-paradise-eb3c1.appspot.com/o/carousel2.jpg?alt=media&token=9f3882cb-91d3-442e-87ac-1d9dbe4f4920',
    'https://firebasestorage.googleapis.com/v0/b/pizza-paradise-eb3c1.appspot.com/o/carousel3.jpg?alt=media&token=6cefbcf9-dc9b-4df6-a967-d1366a7a5f29'
  ];

  final List _swiperImages = [
    'https://firebasestorage.googleapis.com/v0/b/pizza-paradise-eb3c1.appspot.com/o/cezar.jpg?alt=media&token=541cd799-7bdc-41d4-89db-b78d5bb643af',
    'https://firebasestorage.googleapis.com/v0/b/pizza-paradise-eb3c1.appspot.com/o/bolognese.jpg?alt=media&token=7b45be1e-0c37-4987-aeee-f1190101a739',
    'https://firebasestorage.googleapis.com/v0/b/pizza-paradise-eb3c1.appspot.com/o/furnagiska.jpg?alt=media&token=67028620-bc82-45b0-b7ae-decded06dbc8'
  ];

  /*  void fetchImages(String image) async{
    final ref = FirebaseStorage.instance.ref().child(image);
    // no need of the file extension, the name will do fine.
    var url = await ref.getDownloadURL();
    print(url);
    _swiperImages.add(url);
  }*/

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    productsData.FetchProducts();
    final popularItems = productsData.popularProducts;

    return Scaffold(
      body: Center(

          //BACKDROP SCAFFOLD
          child: BackdropScaffold(
        frontLayerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        headerHeight: MediaQuery.of(context).size.height * 0.25,
        appBar: BackdropAppBar(
          title: const Text("Home"),
          leading: const BackdropToggleButton(
            icon: AnimatedIcons.home_menu,
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              ColorsConsts.starterColor,
              ColorsConsts.endColor
            ])),
          ),
          actions: <Widget>[
            IconButton(
              iconSize: 15,
              padding: const EdgeInsets.all(10),
              icon: const CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 13,
                  backgroundImage: NetworkImage(
                      'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                ),
              ),
              onPressed: () {},
            )
          ],
        ),
        backLayer: BackLayerMenu(),
        frontLayer: SingleChildScrollView(
          child: Column(
            //ova go stavat naslovov levo (na start)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 190.0,
                width: double.infinity,
                child: CarouselSlider(
                  items: [
                    Image.network(_carouselImages[0], fit: BoxFit.cover),
                    Image.network(_carouselImages[1], fit: BoxFit.cover),
                    Image.network(_carouselImages[2], fit: BoxFit.cover),
                  ],
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 1000),
                    enableInfiniteScroll: true,
                  ),
                  // boxFit: BoxFit.fill,
                  // dotSize: 5.0,
                  // dotIncreasedColor: Colors.purple,
                  // dotBgColor: Colors.black.withOpacity(0.2),
                  // dotPosition: DotPosition.bottomCenter,
                  // showIndicator: true,
                  // indicatorBgPadding: 5.0,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Categories',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
              ),

              //CATEGORY WIDGET
              Container(
                width: double.infinity,
                height: 180,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext ctx, int index) {
                      return CategoryWidget(
                        index: index,
                      );
                    }),
              ),

              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Popular dishes',
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Container(
                height: 210,
                width: MediaQuery.of(context).size.width * 0.95,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Swiper(
                    itemCount: _swiperImages.length,
                    autoplay: true,
                    onTap: (index) {},
                    itemBuilder: (BuildContext ctx, int index) {
                      return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                              color: Colors.blueGrey,
                              child: Image.network(_swiperImages[index],
                                  fit: BoxFit.cover)));
                    },
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      'Popular products',
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(FeedScreen.routeName,
                            arguments: 'popular');
                      },
                      child: const Text(
                        'View all...',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                            color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 285,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                child: ListView.builder(
                    itemCount: popularItems.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext ctx, int index) {
                      return ChangeNotifierProvider.value(
                        value: popularItems[index],
                        child: PopularProducts(
                            //ova zakomentiranovo e drug pristap preku KONSTRUKOR
                            //ova gore shto go odbrav so ChangeNotifierProvider e so DEPENDENCY INJECTION i mislam deka e podobro

                            /* imageUrl:popularItems[index].imageUrl,
                        title: popularItems[index].title,
                        description: popularItems[index].description,
                        price: popularItems[index].price,*/
                            ),
                      );
                    }),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
