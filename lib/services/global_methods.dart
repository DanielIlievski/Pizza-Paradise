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
                'https://firebasestorage.googleapis.com/v0/b/pizza-paradise-eb3c1.appspot.com/o/warning-emoji.png?alt=media&token=d9758972-f86c-462e-9239-2fc1ece470bf',
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

  Future<void> authErrorHandle(String subtitle, BuildContext context) async {
    showDialog(context: context, builder: (BuildContext ctx){
      return AlertDialog(
        title: Row(
          children:[
            Padding(
              padding: const EdgeInsets.only(right:  6.0),
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/pizza-paradise-eb3c1.appspot.com/o/warning-emoji.png?alt=media&token=d9758972-f86c-462e-9239-2fc1ece470bf',
                height: 20,
                width: 20,),
            ),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Error occured"),
            ),
          ],
        ),
        content: Text(subtitle),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('OK'))

        ],
      );
    });
  }

  Future<void> showLocation(String longitude,String latitude, BuildContext context) async {
    showDialog(context: context, builder: (BuildContext ctx){
      return AlertDialog(
        title: Row(
          children:[
            Padding(
              padding: const EdgeInsets.only(right:  6.0),
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/pizza-paradise-eb3c1.appspot.com/o/info.png?alt=media&token=3e9d65a9-6834-4562-8343-d449f3accf32',
                height: 20,
                width: 20,),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Your location is ${longitude} ${latitude}"),
            ),
          ],
        ),
        content: const Text("nesto"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text('OK'))

        ],
      );
    });
  }
}