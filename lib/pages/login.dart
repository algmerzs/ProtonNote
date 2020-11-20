import 'package:ProtonNotes/pages/principal_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/login.jpg'), fit: BoxFit.cover)),
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Color.fromRGBO(48, 48, 48, 0.25),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15.0),
              Image.asset(
                'assets/logo.png',
                width: 100,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Usuario',
                    hintStyle: Theme.of(context).textTheme.headline1,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.verified_user_rounded),
                    fillColor: Color(0xff303030),
                    filled: true),
              ),
              TextField(
                style: Theme.of(context).textTheme.headline3,
                decoration: InputDecoration(
                    hintText: 'Usuario',
                    hintStyle: Theme.of(context).textTheme.headline1,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.security),
                    fillColor: Color(0xff303030),
                    filled: true),
                obscureText: true,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Ingresar',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                color: Color(0xff4303030),
                splashColor: Color(0xffDFDFDF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
