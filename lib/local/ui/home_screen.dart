import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moor/local/database/databases.dart';
import 'package:flutter_moor/local/database/note_dao.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNote(context);
        },
        child: Icon(Icons.add),
      ),
      body: _buildBody(context),
    );
  }

  StreamBuilder<List<Note>> _buildBody(BuildContext context) {
    final _db = Provider.of<NotesDao>(context, listen: false);
    return StreamBuilder(
        stream: _db.observeAllNotes(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            final List<Note> data = snapshot.data;
            print(data);
            return _buildWidget(context, data, _db);
          } else {
            return Center(
                child: Text(
              'No Note Found',
              style: TextStyle(fontSize: 20),
            ));
          }
        });
  }

  Widget _buildWidget(
      BuildContext context, List<Note> data, NotesDao provider) {
    return Slidable(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(
                data[index].title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(
                data[index].desc,
                style: TextStyle(fontSize: 17),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/details_screen',
                    arguments: data[index]);
              },
              onLongPress: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Are you sure?'),
                        content: Text('Delete this Note'),
                        actions: [
                          RaisedButton(
                              child: Text(
                                'Ok',
                                style: TextStyle(color: Colors.blue),
                              ),
                              onPressed: () {
                                provider.deleteNote(data[index]);
                                Navigator.of(context).pop();
                              }),
                          RaisedButton(
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Colors.blue),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              })
                        ],
                      );
                    });
              },
            ),
          );
        },
      ),
      actionPane: SlidableDrawerActionPane(),
    );
  }

  void addNote(BuildContext context) {
    Navigator.pushNamed(context, '/add_note', arguments: 0);
  }
}
