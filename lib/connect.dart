import 'package:flutter/material.dart';
import 'package:wellcare/connect_card.dart';
import 'package:wellcare/models/connect_card_details.dart';
import 'package:wellcare/services/auth.dart';

class Connect extends StatefulWidget {
  Connect({Key? key}) : super(key: key);

  @override
  State<Connect> createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  @override
  Widget build(BuildContext context) {
    final user = ConnectCardDetails(
        place: "Kochi",
        age: '20',
        urlImage:
            'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
        name: 'Steffen');

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Theme.of(context).primaryColor, Colors.transparent],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        // stops: [0.7, 1],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            child: ConnectCard(connectCardDetails: user),
          ),
        )),
      ),
    );
  }
}
