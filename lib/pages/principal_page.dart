import 'package:ProtonNotes/models/protonNote.dart';
import 'package:ProtonNotes/pages/main_drawer.dart';
import 'package:ProtonNotes/pages/note.dart';
import 'package:ProtonNotes/pages/profile.dart';
import 'package:ProtonNotes/utils/widgets/protonNote_item_widget.dart';
import 'package:flutter/material.dart';

class PrincipalPage extends StatefulWidget {
  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  List<ProtonNote> _listProtonNote = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffDFDFDF),
        appBar: AppBar(
          title: Text('ProtonNotes'),
          centerTitle: true,
          backgroundColor: Color(0xff303030),
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
        body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: ListView.builder(
              itemCount: _listProtonNote.length,
              itemBuilder: (BuildContext context, int index) {
                return ProtonNoteItem(
                  onEdit: _editProtonNote(index, _listProtonNote[index]),
                  protonNoteItem: _listProtonNote[index],
                  onDelete: () {
                    _confirmDelete(index);
                  },
                );
              },
            )),
      ),
    );
  }

  void _goToAddProtonNote() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => NoteCustomization()),
    ).then((protonNoteItem) {
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
              content: Text(
                  '¿Estás seguro de que quieres eleminar esta nota? \n \n ¡No hay vuelta atrás'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('CANCELAR')),
                TextButton(onPressed: () {
                  _deleteProtonNote(index);
                }, child: Text('ACEPTAR')),
              ],
            ));
  }

  void _deleteProtonNote(int index) {
    setState(() {
      _listProtonNote.removeAt(index);
    });
    Navigator.pop(context);
  }

  _editProtonNote(int index, ProtonNote protonNote) {

  }


}
