import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/icon_data.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';

import '/consts/colors.dart';
import '/consts/my_icons.dart';
import '/provider/dark_theme_provider.dart';
import '/screens/cart.dart';
import '/screens/wishlist.dart';


class UserInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // we use Scaffold because we want to return a screen
      body: Container(
          child: const Text('User info')
      ),
    );
  }
}
