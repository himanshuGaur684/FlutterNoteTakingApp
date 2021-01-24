import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moor/local/ui/add_note.dart';
import 'package:flutter_moor/local/ui/details_screen.dart';
import 'package:flutter_moor/local/ui/home_screen.dart';

import '../main.dart';

class Routing {
  static Route<dynamic> routeGenerator(RouteSettings routeSettings){
    final args= routeSettings.arguments;
    switch(routeSettings.name){
      case '/':
        return MaterialPageRoute(builder: (_)=> MyApp());
      case '/add_note':
        return MaterialPageRoute(builder: (_)=> AddNote());
      case '/details_screen':
        return MaterialPageRoute(builder: (_)=> DetailScreen(args));
    }
  }
}