import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // we use Scaffold because we want to return a screen
      body: Container(
          child: const Text('Feed')
      ),
    );
  }
}