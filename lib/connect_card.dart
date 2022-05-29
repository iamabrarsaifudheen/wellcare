import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wellcare/models/connect_card_details.dart';
import 'package:wellcare/models/user_details.dart';

class ConnectCard extends StatefulWidget {
  ConnectCard({Key? key, }) : super(key: key);
  // final UserDetails userDetails;

  @override
  State<ConnectCard> createState() => _ConnectCardState();
}

class _ConnectCardState extends State<ConnectCard> {
    void _getdata() async {
 User? user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore.instance
    .collection('users')
    .doc(user!.uid)
    .snapshots()
    .listen((userData) {
      print(userData);
 
  });
  }
  Stream<List<UserDetails>> readServiceSeekerUser() =>
      FirebaseFirestore.instance
          .collection('users')
          .where("type", isEqualTo: "Looking for service")
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => UserDetails.fromJson(doc.data()))
              .toList());
  Stream<List<UserDetails>> readServiceProviderUser() =>
      FirebaseFirestore.instance
          .collection('users')
          .where("type", isEqualTo: "Looking for work")
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => UserDetails.fromJson(doc.data()))
              .toList());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserDetails>>(
        stream: readServiceSeekerUser(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            final users = snapshot.data;
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        alignment: Alignment(-0.3, 0),
                        image: NetworkImage('https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80')),),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.7, 1],
                  )),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                        children: [Spacer(), _buildName(), _buildPlace()]),
                  ),
                ),
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  _buildPlace() {
    return Row(
      children: [
        Icon(
          Icons.pin_drop_outlined,
          color: Colors.white,
        ),
        Text(" ${widget.userDetails.location}",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            )),
      ],
    );
  }

  _buildName() {
    return Row(
      children: [
        Text(
          "${widget.userDetails.name}, ",
          style: TextStyle(
              fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // Text(widget.connectCardDetails.age,
        //     style: TextStyle(
        //       fontSize: 32,
        //       color: Colors.white,
        //     ))
      ],
    );
  }
}
