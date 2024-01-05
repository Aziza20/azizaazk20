 import 'package:flutter/material.dart'
import 'package: Firebase_auth/Firebase_auth.dart'
 

class SignInPage extends StatefulWidget {
 @override
 _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
 final _auth = Firebase.au;
 String email;
 String password;

 Future<void> _signIn() async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("User signed in: ${user.uid}");
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
              onPressed: _signIn,
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
 }
}

class RaisedButton {
}