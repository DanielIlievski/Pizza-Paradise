import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
//  const CategoryWidget({Key? key}) : super(key: key);
//ovde namerno index e staveno na index=1 za da funkcionirat sega duri ne e zavrsen delov
//hardcoded e ke se  smenit posle [PETAR]
  CategoryWidget({Key? key,   this.index=1}) : super(key: key);

  final int index;

//mapa od image path i naslovot na kategorijata
  List<Map<String,Object>> categories = [
    {
      'categoryName': 'Pizza',
      'categoryImagesPath': 'images/pizza1.jpg',
    },
    {
      'categoryName': 'Pasta1',
      'categoryImagesPath': 'images/pasta1.jpg',
    },
    {
      'categoryName': 'Pasta2',
      'categoryImagesPath': 'images/pasta2.jpg',
    },
    {
      'categoryName': 'Pasta3',
      'categoryImagesPath': 'images/pasta3.jpg',
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //vo videata go nemat ova as String na kraj ama mi davase error deka od Object ne mojt cast vo String
              //stack overflow: https://stackoverflow.com/questions/67853012/how-can-i-resolve-the-argument-type-object-cant-be-assigned-to-the-paramete
              image: DecorationImage(
                image: AssetImage(categories[index]['categoryImagesPath'] as String),
                fit: BoxFit.cover,
              )
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: 150,


        ),
        Positioned(
            bottom:0,
            left:10,
            right:10,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                color: Theme.of(context).backgroundColor,
                //isto i ovde kako gore  errorot
                //NE E RESEN OVOJ ERROR (NE GO POKAZHUVA IMETO VO APPPLIKACIJATA)
                child: Text(categories[index]['categoryName'] as String,
                    style: TextStyle(fontWeight: FontWeight.w500,
                      fontSize: 18, color: Theme.of(context).backgroundColor,)))
        ),
      ],
    );
  }
}
