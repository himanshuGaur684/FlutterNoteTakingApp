import 'package:flutter/material.dart';
import 'package:flutter_moor/local/database/databases.dart';
import 'package:flutter_moor/local/ui/home_screen.dart';
import 'package:flutter_moor/routing/routing.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_)=> Databases().notesDao)
      ],
      child: MaterialApp(
        initialRoute: '/',
        onGenerateRoute: Routing.routeGenerator,
        home: HomePage(),
      ),
    );
  }
}
