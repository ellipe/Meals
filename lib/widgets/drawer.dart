import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildListItem(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 56,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              color: Theme.of(context).primaryColor,
              child: Text(
                'Cooking Up!',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 26,
                    color: Colors.white),
              ),
            ),
            _buildListItem(
              'Meals',
              Icons.restaurant,
              () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            _buildListItem(
              'Settings',
              Icons.settings,
              () {

                Navigator.of(context).pushReplacementNamed('/settings');
              },
            ),
          ],
        ),
      ),
    );
  }
}
