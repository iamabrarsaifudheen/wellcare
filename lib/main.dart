import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellcare/authenticate.dart';
import 'package:wellcare/connect.dart';
import 'package:wellcare/connect_card.dart';
import 'package:wellcare/custom_bottom_navigation.dart';
import 'package:wellcare/services/auth.dart';
import 'package:wellcare/sign_in.dart';
import 'package:wellcare/sign_up.dart';
import 'package:wellcare/wrapper.dart';

import 'models/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      catchError: (_, __) => null,
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: 'Montserrat',
            primaryColor: const Color(0xff1E3E72),
          ),
          home: Wrapper()),
    );
  }
}
