import 'package:flutter/material.dart';

class GlobalMethods{


  //metod koj se povikuva pred da se izbrise item od cart kako predupreduvanje
  Future<void> showDialogg(String title, String subtitle, Function fct, BuildContext context) async {
    showDialog(context: context, builder: (BuildContext ctx){
      return AlertDialog(
        title: Row(
          children:[
            Padding(
              padding: const EdgeInsets.only(right:  6.0),
              child: Image.network(
                'https://img.icons8.com/emoji/48/warning-emoji.png',
                height: 30,
                width: 30,),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title),
            ),
          ],
        ),
        content: Text(subtitle),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
          TextButton(onPressed: (){
            fct();
            Navigator.pop(context);
          }, child: Text('OK'))

        ],
      );
    });
  }


}