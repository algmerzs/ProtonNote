import 'package:ProtonNotes/pages/login.dart';
import 'package:ProtonNotes/pages/profile.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Mariana Zapata',
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Profile(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.notes_sharp),
            title: Text(
              'Notas',
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(
              'Cerrar sesión',
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage(),
                  ),
                  (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
