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
        color: protonNoteItem.color,
        child: ListTile(
          leading: CircleAvatar(
            child: protonNoteItem.icon,
            backgroundColor: Colors.grey[300],
          ),
          title: Text(protonNoteItem.title),
          trailing: IconButton(
            onPressed: onDelete,
            icon: Icon(
              Icons.delete,
              color: Color(0xff303030),
            ),
          ),
        ),
      ),
    );
  }
}
