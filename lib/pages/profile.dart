import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffDFDFDF),
        appBar: AppBar(
          title: Text('Perfil'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/user.png',
                  width: 200,
                ),
                Text('Mariana Zapata'),
                Text('Aprendiz'),
                Text('Medellín - Colombia'),
                Image.asset(
                  'assets/ruthless.png',
                  width: 100,
                ),
                FlatButton(
                  color: Colors.grey[900],
                  onPressed: () {},
                  child: Text('Cerrar Sesión'),
                )
              ],
            ),
          ),
        ));
  }
}
