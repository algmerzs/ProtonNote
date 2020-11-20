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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff3DFDFDF),
        appBar: AppBar(
          backgroundColor: Color(0xff303030),
          centerTitle: false,
          title: Text('ProtonNotes'),
          actions: [
            GestureDetector(
              child: CircleAvatar(
                  backgroundColor: Colors.white, child: Icon(Icons.add)),
              onTap: () {
                _goToAddProtonNote();
              },
            ),
            SizedBox(width: 20.0),
            GestureDetector(
              child: Icon(Icons.person),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Profile(),
                  ),
                );
              },
            ),
            SizedBox(width: 20.0)
          ],
        ),
        drawer: MainDrawer(),
        body: ListView.builder(
            itemCount: _listProtonNote.length,
            itemBuilder: (BuildContext context, int index) {
              return ProtonNoteWidget(
                protonNoteItem: _listProtonNote[index],
                onDelete: () {
                  _confirmDelete(index);
                },
                onEdit: () {
                  _editProtonNote(index, _listProtonNote[index]);
                },
              );
            }),
      ),
    );
  }

  void _goToAddProtonNote() {
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
        title: Text('Borrar Nota'),
        content: Text('¿Estas seguro de eliminar este nota?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('CANCELAR')),
          TextButton(
            onPressed: () {
              _deleteProtonNote(index);
            },
            child: Text('ACEPTAR'),
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

  void _editProtonNote(int index, ProtonNote protonNote) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => NoteCustomization(
                  protonNote: protonNote,
                  color: protonNote.color,
                ))).then((protonNoteItem) {
      if (protonNoteItem != null) {
        setState(() {
          _listProtonNote[index] = protonNoteItem;
        });
      }
    });
  }
}
