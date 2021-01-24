import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moor/local/database/databases.dart';

class DetailScreen extends StatefulWidget {
  Note args;

  DetailScreen(Object args) {
    this.args = args as Note;
  }

  @override
  _DetailScreenState createState() => _DetailScreenState(args);
}

class _DetailScreenState extends State<DetailScreen> {
  Note args;

  _DetailScreenState(Note args) {
    this.args = args;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              this.args.title,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Text(
                this.args.desc,
                style: TextStyle(fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}
