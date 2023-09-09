import 'package:flutter/material.dart';
import '/consts/colors.dart';
import '/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class WishlistEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 80),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('/images/empty-wishlist.png'))),
        ),
        Text(
          'Your wishlist is empty',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Theme.of(context).textSelectionTheme.selectionColor,
              fontSize: 36,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'It looks like you did not \n add anything to your wishlist yet',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: themeChange.darkTheme
                  ? Theme.of(context).disabledColor
                  : ColorsConsts.subTitle,
              fontSize: 26,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.06,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: Colors.red)),
              backgroundColor: Colors.redAccent,
            ),
            child: Text(
              'Add a wish'.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).textSelectionTheme.selectionColor,
                  fontSize: 26,
                  fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }
}
