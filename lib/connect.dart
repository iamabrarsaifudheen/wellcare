import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wellcare/connect_card.dart';
import 'package:wellcare/models/connect_card_details.dart';
import 'package:wellcare/models/user_details.dart';
import 'package:wellcare/services/auth.dart';

class Connect extends StatefulWidget {
  Connect({Key? key}) : super(key: key);

  @override
  State<Connect> createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {



         

  @override
  Widget build(BuildContext context) {
    
   
   

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
          child: ConnectCard(),
        )),
      ),
    );
  }
}
