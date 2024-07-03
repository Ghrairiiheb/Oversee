import 'dart:async';

import 'package:flutter/material.dart';

class spalsh extends StatefulWidget {
  const spalsh({super.key});

  @override
  State<spalsh> createState() => _spalshState();
}

class _spalshState extends State<spalsh> {
    @override
  void initState() {
    super.initState();
    // Utilisez Timer pour naviguer après 2 secondes.
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.supervised_user_circle, 
              size: 100.0, 
              color: Colors.blue, 
            ),
            SizedBox(height: 20),
            Text(
              'Bienvenue à OverSee',
              style: TextStyle(
                fontSize: 40,
                color: Colors.blue,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            Text('')
          ],
        ),
      ),
    );
  }
}