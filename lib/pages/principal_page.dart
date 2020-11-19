import 'package:ProtonNotes/models/protonNote.dart';
import 'package:ProtonNotes/pages/main_drawer.dart';
import 'package:ProtonNotes/pages/note.dart';
import 'package:ProtonNotes/pages/profile.dart';
import 'package:ProtonNotes/utils/widgets/protonNote_item_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProtonNote> _listProtonNote = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODOs'),
      ),
      body: ListView.builder(
          itemCount: _listProtonNote.length,
          itemBuilder: (BuildContext context, int index) {
            return ProtonNoteWidget(
              protonNoteItem: _listProtonNote[index],
              onDelete: () {
                _confirmDelete(index);
              },
              onEdit: () {
                _editTodo(index, _listProtonNote[index]);
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _goToAddPage();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _goToAddPage() {
    Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => NoteCustomization()))
        .then((protonNoteItem) {
      if (protonNoteItem != null) {
        setState(() {
          _listProtonNote.add(protonNoteItem);
        });
      }
    });
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Borrar TODO'),
        content: Text('¿Estas seguro de eliminar este TODO?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar')),
          TextButton(
            onPressed: () {
              _deleteProtonNote(index);
            },
            child: Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  void _deleteProtonNote(int index) {
    setState(() {
      _listProtonNote.removeAt(index);
    });
    Navigator.pop(context);
  }

  void _editTodo(int index, ProtonNote protonNote) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => NoteCustomization(
                  protonNote: protonNote,
                ))).then((protonNoteItem) {
      if (protonNoteItem != null) {
        setState(() {
          _listProtonNote[index] = protonNoteItem;
        });
      }
    });
  }
}
