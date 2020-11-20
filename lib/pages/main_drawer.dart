import 'package:ProtonNotes/pages/login.dart';
import 'package:ProtonNotes/pages/profile.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xff303030),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.person, color: Color(0xffDFDFDF)),
              title: Text(
                'Mariana Zapata',
                style: TextStyle(fontSize: 20.0, color: Color(0xffDFDFDF)),
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
            Container(
              color: Color(0xfff898A4),
              child: ListTile(
                leading: Icon(Icons.notes_sharp, color: Color(0xffDFDFDF)),
                title: Text(
                  'Notas',
                  style: TextStyle(fontSize: 20.0, color: Color(0xffDFDFDF)),
                ),
                onTap: () {},
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_back, color: Color(0xffDFDFDF)),
              title: Text(
                'Cerrar sesión',
                style: TextStyle(fontSize: 20.0, color: Color(0xffDFDFDF)),
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
      ),
    );
  }
}
