import 'dart:io';
import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wellcare/services/auth.dart';
import 'package:wellcare/widgets/button.dart';
import 'package:wellcare/widgets/text_box.dart';

class DetailsServiceSeeker extends StatefulWidget {
  DetailsServiceSeeker(
      {Key? key,
      required this.email,
      required this.password,
      required this.name,
      required this.type})
      : super(key: key);
  final String email;
  final String password;
  final String name;
  final String type;

  @override
  State<DetailsServiceSeeker> createState() => _DetailsServiceSeekerState();
}

class _DetailsServiceSeekerState extends State<DetailsServiceSeeker> {
  PlatformFile? pickedFile;
  String? address = '';
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future uploadFile() async {
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 36),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Well Care',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 24)),
                  Text('Join to get the best care'),
                  SizedBox(
                    height: height / 16,
                  ),
                  TextBox(
                      hintText: 'Describe about yourself ...',
                      controller: _descriptionController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      type: 'email'),
                  SizedBox(height: height / 40),
                  TextBox(
                      hintText: 'Phone Number',
                      controller: _phoneNumberController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      type: 'number'),
                  SizedBox(height: height / 40),
                   Button(
                      onPressed: () async {
                        await selectFile();
                        await uploadFile();
                      },
                      text: 'Upload you pic'),
                  Text(
                    'Please Upload Discahrge Summary Certificate ',
                    style: TextStyle(fontSize: 16),
                  ),
                  Button(
                      onPressed: () async {
                        await selectFile();
                        await uploadFile();
                      },
                      text: 'Upload Document'),
                  // Button(
                  //     onPressed: selectFile,
                  //     text: pickedFile == null
                  //         ? 'Select Document'
                  //         : pickedFile!.name),
                  // SizedBox(
                  //   height: height / 40,
                  // ),
                  // // Text(pickedFile!.name),
                  // Button(onPressed: uploadFile, text: 'Upload document '),
                  SizedBox(height: height / 40),
                  Button(
                      onPressed: () async {
                        _determinePosition();
                        Position position = await Geolocator.getCurrentPosition(
                          desiredAccuracy: LocationAccuracy.high,
                        );
                        getAddressFromLatLong(position);
                        print(position.toString());
                      },
                      text: address != ''
                          ? "You are now at ${address}"
                          : 'Get My Location'),
                  SizedBox(height: height / 20),
                  Button(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final ref = FirebaseStorage.instance.ref().child('testimage');
var url = await ref.getDownloadURL();
                          await AuthService().registerWithEmailAndPassword(
                              widget.email, widget.password);
                          AuthService().createUser(
                            urlAadhar: "",
                            urlCertificate: "",
                            urlDischargeSummeryCertificate: "",
                            urlPic: "",

                              name: widget.name,
                              email: widget.email,
                              description: _descriptionController.text,
                              number: _phoneNumberController.text,
                              referenceContact: "",
                              location: address.toString(),
                              type: widget.type);
                          Navigator.pop(context);

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Welcome')),
                          );
                        }
                      },
                      text: 'Sign Up'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // print(placemarks);
    Placemark place = placemarks[0];
    setState(() {
      address = '${place.locality}';
    });

    print(address);
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}
