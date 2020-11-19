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
        child: ListTile(
          leading: CircleAvatar(
            child: Text(_getFirstTwoWordsTitle()),
            backgroundColor: Colors.yellow,
          ),
          title: Text(protonNoteItem.title),
          subtitle: Text(protonNoteItem.subtitle),
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

  String _getFirstTwoWordsTitle() {
    return protonNoteItem.title.substring(0, 2).toUpperCase();
  }
}
