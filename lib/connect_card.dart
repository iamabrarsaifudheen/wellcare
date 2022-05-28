import 'package:flutter/material.dart';
import 'package:wellcare/models/connect_card_details.dart';

class ConnectCard extends StatefulWidget {
  ConnectCard({Key? key, required this.connectCardDetails}) : super(key: key);
  final ConnectCardDetails connectCardDetails;

  @override
  State<ConnectCard> createState() => _ConnectCardState();
}

class _ConnectCardState extends State<ConnectCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                alignment: Alignment(-0.3, 0),
                image: NetworkImage(widget.connectCardDetails.urlImage))),
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
            child: Column(children: [Spacer(), _buildName(), _buildPlace()]),
          ),
        ),
      ),
    );
  }

  _buildPlace() {
    return Row(
      children: [
        Icon(
          Icons.pin_drop_outlined,
          color: Colors.white,
        ),
        Text(" ${widget.connectCardDetails.place}",
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
          "${widget.connectCardDetails.name}, ",
          style: TextStyle(
              fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(widget.connectCardDetails.age,
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
            ))
      ],
    );
  }
}
