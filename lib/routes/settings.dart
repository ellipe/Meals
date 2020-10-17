import 'package:Meals/widgets/drawer.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final Function _setSettings;
  final Map<String, bool> _settings;

  SettingsScreen(this._settings, this._setSettings);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget._settings['glutten'];
    _vegetarian = widget._settings['vegetarian'];
    _vegan = widget._settings['vegan'];
    _lactoseFree = widget._settings['lactose'];

    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateHandler) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final currentSettings = {
                  'glutten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget._setSettings(currentSettings);
                Navigator.of(context).pushReplacementNamed('/');
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(children: [
              _buildSwitchListTile('Gluten Free',
                  'Only include glutten free meals.', _glutenFree, (val) {
                setState(() {
                  _glutenFree = val;
                });
              }),
              _buildSwitchListTile(
                  'Vegetarian', 'Only include vegetarian meals.', _vegetarian,
                  (val) {
                setState(() {
                  _vegetarian = val;
                });
              }),
              _buildSwitchListTile('Vegan', 'Only include vegan meals.', _vegan,
                  (val) {
                setState(() {
                  _vegan = val;
                });
              }),
              _buildSwitchListTile('Lactose Free',
                  'Only include lactose free meals.', _lactoseFree, (val) {
                setState(() {
                  _lactoseFree = val;
                });
              }),
            ]),
          )
        ],
      ),
    );
  }
}
