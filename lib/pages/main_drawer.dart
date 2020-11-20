import 'package:ProtonNotes/pages/login.dart';
import 'package:ProtonNotes/pages/profile.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xffDFDFDF),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                'Mariana Zapata',
                style: Theme.of(context).textTheme.headline2,
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
              color: Color(0xff303030),
              child: ListTile(
                leading: Icon(Icons.notes_sharp, color: Color(0xffDFDFDF)),
                title: Text(
                  'Notas',
                  style: Theme.of(context).textTheme.headline3,
                ),
                onTap: () {},
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text(
                'Cerrar sesión',
                style: Theme.of(context).textTheme.headline2,
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
