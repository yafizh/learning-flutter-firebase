import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text(
          "Brew Crew",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: [
          TextButton.icon(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text(
              "logout",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
    );
  }
}
