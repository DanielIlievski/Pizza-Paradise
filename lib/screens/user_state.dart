import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/screens/landing_page.dart';
import '/screens/main_screen.dart';

class UserState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        // ignore: missing_return
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (userSnapshot.connectionState == ConnectionState.active) {
            if (userSnapshot.hasData) {
              print('The user is already logged in');
              return MainScreens();
            } else  {
              print('The user didn\'t login yet');
              return LandingPage();
            }
          } else if (userSnapshot.hasError) {
            return const Center(
              child: Text('Error occured'),
            );
          }
          else{
            return const Center(
              child: Text('Error occured'),
            );
          }
        });
  }
}
