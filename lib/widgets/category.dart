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
      'categoryImagesPath': 'images/pizza1.jpg',
    },
    {
      'categoryName': 'Pasta',
      'categoryImagesPath': 'images/pasta1.jpg',
    },
    {
      'categoryName': 'Pastrmajlija',
      'categoryImagesPath': 'images/pasta2.jpg',
    },
    {
      'categoryName': 'Specijaliteti',
      'categoryImagesPath': 'images/pasta3.jpg',
    },
    {
      'categoryName': 'Deserti',
      'categoryImagesPath': 'images/pasta3.jpg',
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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                //vo videata go nemat ova as String na kraj ama mi davase error deka od Object ne mojt cast vo String
                //stack overflow: https://stackoverflow.com/questions/67853012/how-can-i-resolve-the-argument-type-object-cant-be-assigned-to-the-paramete
                image: DecorationImage(
                  image: AssetImage(
                      categories[widget.index]['categoryImagesPath'] as String),
                  fit: BoxFit.cover,
                )),
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
                child: Text(categories[widget.index]['categoryName'].toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Theme.of(context).backgroundColor,
                    )))),
      ],
    );
  }
}
