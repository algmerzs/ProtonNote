import 'package:ProtonNotes/models/protonNote.dart';
import 'package:flutter/material.dart';

class ProtonNoteWidget extends StatelessWidget {
  final ProtonNote protonNoteItem;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  ProtonNoteWidget({
    @required this.protonNoteItem,
    @required this.onDelete,
    @required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onEdit,
      child: Card(
        color: Colors.green,
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.add),
            backgroundColor: Colors.yellow,
          ),
          title: Text(protonNoteItem.title),
          trailing: IconButton(
            onPressed: onDelete,
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
