import 'package:flutter/material.dart';
import 'package:wellcare/services/auth.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: ElevatedButton(
            onPressed: () {
              AuthService().signOut();
            },
            child: Text('Sign Out')),
      ),
    );
  }
}
