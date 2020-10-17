import 'package:Meals/models/meal.dart';
import 'package:Meals/routes/settings.dart';
import 'package:Meals/seeds/dummy_data.dart';
import 'package:flutter/material.dart';

// Routes
import './routes/tabs.dart';
import './routes/meals.dart';
import './routes/meal-detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _settings = {
    'glutten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setSettings(Map<String, bool> settingsData){
    setState(() {
      _settings = settingsData;
    });

    _availableMeals = DUMMY_MEALS.where((meal) {
      if (_settings['glutten'] && !meal.isGlutenFree) {
        return false;
      }
      if (_settings['lactose'] && !meal.isLactoseFree) {
        return false;
      }
      if (_settings['vegetarian'] && !meal.isVegetarian) {
        return false;
      }
      if (_settings['vegan'] && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.indigo,
        accentColor: Color.fromRGBO(5, 164, 198, 1),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        '/meals': (ctx) => MealsScreen(_availableMeals),
        '/meal-detail': (ctx) => MealDetailScreen(),
        '/settings': (ctx) => SettingsScreen(_settings, _setSettings),
      },
    );
  }
}
