import 'package:flutter/material.dart';

import 'upload_product_form.dart';
import '/screens/upload_product_form.dart';
import '/screens/landing_page.dart';

import 'bottom_bar.dart';

class MainScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [BottomBarScreen(), UploadProductForm()],
    );
  }
}
