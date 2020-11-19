import 'package:ProtonNotes/models/protonNote.dart';
import 'package:flutter/material.dart';

class ProtonNoteItem extends StatelessWidget {
  final ProtonNote protonNoteItem;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  ProtonNoteItem({this.protonNoteItem, @required this.onDelete, @required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: protonNoteItem.color,
        child: ListTile(
          leading: CircleAvatar(
              backgroundColor: Colors.grey[300], child: protonNoteItem.icon),
          title: Text(protonNoteItem.title),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: onDelete, icon: Icon(Icons.delete, color: Color(0xff303030),)),
              IconButton(onPressed: onEdit, icon: Icon(Icons.auto_fix_high, color: Color(0xff303030),)),
            ],
          ) ,

        ),
      );
  }
}