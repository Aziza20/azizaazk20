import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'signin.dart';

class SignUpPage extends StatefulWidget {
 @override
 _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
 final _auth = FirebaseAuth.instance;
 late String email;
 String password;

 Future<void> _signUp() async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("User signed up: ${user.uid}");
    } catch (e) {
      print(e);
    }
 }

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
            ),
            RaisedButton(
              onPressed: _signUp,
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
 }
}