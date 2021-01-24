import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_moor/local/database/databases.dart';
import 'package:flutter_moor/local/database/note_dao.dart';
import 'package:provider/provider.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final _title = TextEditingController();
  final _desc = TextEditingController();

  String title;
  String desc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddNote'),
      ),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _buildBody(context);
          done(context, title, desc);
        },
        child: Icon(Icons.check),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 30, 16, 16),
          child: TextField(
            decoration: InputDecoration(
                hintText: 'Title',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(3))),
            keyboardType: TextInputType.text,
            controller: _title,
            onChanged: (title) {
              this.title = _title.text.toString();
            },
            onSubmitted: (title) {
              this.title = _title.text.toString();
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: TextField(
              onChanged: (desc) {
                this.desc = _desc.text.toString();
              },
              keyboardType: TextInputType.text,
              controller: _desc,
              decoration: InputDecoration(
                  hintText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                  ))),
        ),
      ],
    );
  }

  void done(BuildContext context, String title, String desc) {
    final db = Provider.of<NotesDao>(context, listen: false);
    Note n = Note(title: title, desc: desc);
    db.insertNote(n);
    this.title = '';
    this.desc = '';
    Navigator.pop(context);
  }
}
