import 'package:Meals/routes/categories.dart';
import 'package:Meals/routes/favorites.dart';
import 'package:Meals/widgets/drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'page' : CategoriesScreen(), 'title': 'Categories'},
    {'page' : FavoritesScreen(), 'title': 'Favorites'},
  ];
  int _selectedPageIndex = 0;

  void _selectedPage(int idx) {
    setState(() {
      _selectedPageIndex = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title'])),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          )
        ],
      ),
    );
  }
}
