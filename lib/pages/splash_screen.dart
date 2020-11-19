import 'package:ProtonNotes/pages/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: 3000),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffDFDFDF),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Center(
              child: Image.asset(
                'assets/logo.png',
                width: 250,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                child: Text(
                  '!Bienvenido!',
                )),
            Spacer(),
            Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4F1C75)),
              ),
            ),
            Spacer(),
            Center(child: Image.asset('assets/sofka.png')),
          ],
        ));
  }
}
