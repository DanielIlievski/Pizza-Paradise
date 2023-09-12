import 'package:flutter/material.dart';
import '/inner_screens/categories_feed.dart';
import '/screens/feeds.dart';

class CategoryWidget extends StatefulWidget {
  CategoryWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
//mapa od image path i naslovot na kategorijata
  List<Map<String, Object>> categories = [
    {
      'categoryName': 'Pizza',
      'categoryImagesPath':
          'https://firebasestorage.googleapis.com/v0/b/pizza-paradise-eb3c1.appspot.com/o/pizza1.jpg?alt=media&token=2ee39ff9-71db-4d24-bc71-fbb45157b2f6',
    },
    {
      'categoryName': 'Pasta',
      'categoryImagesPath':
          'https://firebasestorage.googleapis.com/v0/b/pizza-paradise-eb3c1.appspot.com/o/pasta1.jpg?alt=media&token=a80c4219-3eb1-4e28-8cc9-67bea807a04b',
    },
    {
      'categoryName': 'Pastrmajlija',
      'categoryImagesPath':
          'https://firebasestorage.googleapis.com/v0/b/pizza-paradise-eb3c1.appspot.com/o/pastrmajlija.jpg?alt=media&token=cdcf7076-9628-49a0-b2c6-ed0d6bc34861',
    },
    {
      'categoryName': 'Specialities',
      'categoryImagesPath':
          'https://firebasestorage.googleapis.com/v0/b/pizza-paradise-eb3c1.appspot.com/o/pasta3.jpg?alt=media&token=b5fb50c0-b6b8-4c72-aebf-f3b086f0aced',
    },
    {
      'categoryName': 'Desserts',
      'categoryImagesPath':
          'https://firebasestorage.googleapis.com/v0/b/pizza-paradise-eb3c1.appspot.com/o/blagapizza.jpg?alt=media&token=c8299600-d01f-43c7-bf60-a7e259b21259',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            //koga ke se stisne nekoja kategorija da navigira kon
            //soodvetniot FeedScreen (na primer: FeedScreen za Pizza, FeedScreen za Pasta, itn itn)

            //**VAZNO**
            //kako gi zemame produktite od soodvetnata kategorija?
            //taka sto vo funkcijava podole pushtame arguments
            //od home.dart mozhe da vidime deka vrakjame INDEX od CategoryWidget

            Navigator.of(context).pushNamed(CategoriesFeedScreen.routeName,
                arguments: '${categories[widget.index]['categoryName']}');
          },
          child: Container(
            child: Image.network(
              categories[widget.index]['categoryImagesPath'] as String,
              fit: BoxFit.cover,
            ),
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //     //vo videata go nemat ova as String na kraj ama mi davase error deka od Object ne mojt cast vo String
            //     //stack overflow: https://stackoverflow.com/questions/67853012/how-can-i-resolve-the-argument-type-object-cant-be-assigned-to-the-paramete
            //     image: DecorationImage(
            //       image: AssetImage(
            //           categories[widget.index]['categoryImagesPath'] as String),
            //       fit: BoxFit.cover,
            //     )),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 150,
            height: 150,
          ),
        ),
        Positioned(
            bottom: 0,
            left: 10,
            right: 10,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: Theme.of(context).backgroundColor,
                //isto i ovde kako gore  errorot
                //NE E RESEN OVOJ ERROR (NE GO POKAZHUVA IMETO VO APPPLIKACIJATA)
                child: Text(categories[widget.index]['categoryName'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    )))),
      ],
    );
  }
}
