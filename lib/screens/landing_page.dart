import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '/consts/colors.dart';
import '/screens/bottom_bar.dart';
import '/screens/auth/login.dart';
import '/screens/auth/signup.dart';
import '/services/global_methods.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  List<String> images = [
    'https://images.pexels.com/photos/905847/pexels-photo-905847.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/5949885/pexels-photo-5949885.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/2532006/pexels-photo-2532006.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/4253128/pexels-photo-4253128.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  ];

  final FirebaseAuth _auth = FirebaseAuth.instance;
  GlobalMethods _globalMethods = GlobalMethods();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    images.shuffle();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((animationStatus) {
            if (animationStatus == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
          });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  //GOOGLE SIGN IN
  Future<void> _googleSignIn() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();

    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          //initialize a date for fulfilling the 'joinedAt' field at the database
          var date = DateTime.now().toString();
          var dateParse = DateTime.parse(date);
          var formattedDate =
              "${dateParse.day}-${dateParse.month}-${dateParse.year}";

          final authResult = await _auth.signInWithCredential(
              GoogleAuthProvider.credential(
                  accessToken: googleAuth.accessToken,
                  idToken: googleAuth.idToken));
          // ACCESS THE FIRESTORE (nosqsl database) to add new User to the collection
          await FirebaseFirestore.instance
              .collection('users')
              .doc(authResult.user?.uid)
              .set({
            'id': authResult.user?.uid,
            'name': authResult.user?.displayName,
            'email': authResult.user?.email,
            'phoneNumber': authResult.user?.phoneNumber,
            'imageUrl': authResult.user?.photoURL,
            'joinedAt': formattedDate,
            'createdAt': Timestamp.now(),
          });
        } catch (error) {
          _globalMethods.authErrorHandle(error.toString(), context);
        }
      }
    }
  }

  //ANONIMOUSLY SIGN IN
  void _loginAnonymously() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await _auth.signInAnonymously();
    } catch (error) {
      _globalMethods.authErrorHandle(error.toString(), context);
      print('error occured ${error.toString()}');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      CachedNetworkImage(
        imageUrl: images[1],
        // placeholder: (context, url) => Image.network(
        //   'https://image.flaticon.com/icons/png/128/564/564619.png',
        //   fit: BoxFit.contain,
        // ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: FractionalOffset(_animation.value, 0),
      ),
      Container(
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Welcome to the best pizzeria in town!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: ColorsConsts.backgroundColor),
                      ),
                    )),
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.routeName);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Feather.user,
                          size: 18,
                        )
                      ],
                    )),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.pink.shade400),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side:
                                BorderSide(color: ColorsConsts.backgroundColor),
                          ),
                        )),
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpScreen.routeName);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign up',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Feather.user_plus,
                          size: 18,
                        )
                      ],
                    )),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                ),
              ),
              Text(
                'Or continue with',
                style: TextStyle(color: Colors.black),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(width: 2, color: Colors.red)),
                onPressed: _googleSignIn,
                child: const Text('Google +'),
              ),
              _isLoading
                  ? const CircularProgressIndicator()
                  : OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: const StadiumBorder(),
                          side: const BorderSide(
                              width: 2, color: Colors.deepPurple)),
                      onPressed: () {
                        _loginAnonymously();
                        // Navigator.pushNamed(context, BottomBarScreen.routeName);
                      },
                      child: const Text('Continue as a guest'),
                    ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    ]));
  }
}
