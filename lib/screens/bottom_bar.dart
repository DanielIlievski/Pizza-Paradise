import 'package:flutter/material.dart';

import '/consts/my_icons.dart';

import 'search.dart';
import 'user_info.dart';
import 'cart.dart';
import 'feeds.dart';
import 'home.dart';

class BottomBarScreen extends StatefulWidget {
  static const routeName = '/BottomBarScreen';
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {

  // We need an index in order to know which page we are displaying
  int _selectedIndex = 0;

  var _pages;

  // Initializing the screens in order to display them
  @override
  void initState() {
    _pages = [
      {
        'page': HomeScreen(),
        'title': 'Home Screen'
      },
      {
        'page': FeedScreen(),
        'title': 'Feeds Screen'
      },
      {
        'page': SearchScreen(),
        'title': 'Search Screen'
      },
      {
        'page': CartScreen(),
        'title': 'Cart Screen'
      },
      {
        'page': UserInfoScreen(),
        'title': 'User Info Screen'
      },
    ];
    super.initState();
  }

  // Once the user presses any bottom of the navigation bar, the index will be changed
  void _selectedPage(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  // We need to map the index and the screens so we know which screen corresponds to which index
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(_pages[_selectedIndex]!['title'] as String),),
      body: _pages[_selectedIndex]!['page'] as Widget,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 3, // the margin about the circular search buttom
        clipBehavior: Clip.antiAlias,
        //elevation: 5,
        shape: const CircularNotchedRectangle(),
        child: Container(
          //height: kBottomNavigationBarHeight * 0.8,
          decoration:
          const BoxDecoration(border: Border(top: BorderSide(width: 0.2),)),
          child: BottomNavigationBar(onTap: _selectedPage,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
            selectedItemColor: Theme.of(context).primaryColor,
            currentIndex: _selectedIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(MyAppIcons.home),
                tooltip: 'Home',
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(MyAppIcons.rss),
                tooltip: 'Feeds',
                label: 'Feeds',
              ),
              BottomNavigationBarItem(
                activeIcon: null,
                icon: Icon(null),
                tooltip: 'Search',
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(MyAppIcons.cart),
                tooltip: 'Cart',
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(MyAppIcons.user),
                tooltip: 'User',
                label: 'User',
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.amber,
          tooltip: 'Search',
          elevation: 5,
          child: (const Icon(MyAppIcons.search)),
          onPressed: () {
            setState(() {
              _selectedIndex = 2;
            });
          }
      ),
    );
  }
}