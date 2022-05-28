import 'package:flutter/material.dart';
import 'package:wellcare/authenticate.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
    // final user = Provider.of<UserModel?>(context);
    // // listener for auth state
    // if (user == null) {
    //   print("user sign out");
    //   return  Authenticate(); // or the sign in view
    // } else {
    //   print(user.uid);
    //   print("user sign in");
    //   return const Home();
    //   // home screen with the user as argument for easier access in the future
    // }
  }
}
