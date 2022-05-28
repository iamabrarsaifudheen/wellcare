import 'package:flutter/material.dart';
import 'package:wellcare/widgets/button.dart';
import 'package:wellcare/widgets/text_box.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key, required this.toggleView}) : super(key: key);

  final Function toggleView;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  String? selectedType;

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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 36, vertical: 50),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Well Care',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 24)),
                        Text('Join to get the best care'),
                        SizedBox(
                          height: height / 14,
                        ),
                        Image.asset('assets/images/sign_up.png'),
                        SizedBox(
                          height: height / 16,
                        ),
                        TextBox(
                          type: 'email',
                          hintText: "Email",
                          controller: _emailController,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: height / 40),
                        TextBox(
                          type: 'password',
                          hintText: "Password",
                          controller: _passwordController,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: height / 40),
                        TextBox(
                          type: 'username',
                          hintText: "Name",
                          controller: _usernameController,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: height / 40),
                        getDropDownMenu(),
                        SizedBox(height: height / 20),
                        Button(
                          text: "SUBMIT",
                          onPressed: () async {},
                        ),
                        Center(
                          child: TextButton(
                              onPressed: () {
                                widget.toggleView();
                              },
                              child: Text("Already A Member? Sign In")),
                        ),
                      ],
                    ),
                  ),
                ))));
  }

  Widget getDropDownMenu() {
    return DropdownButtonFormField(
        decoration: InputDecoration(
          hintText: "What are you looking for ?",
          enabled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
            // borderRadius: BorderRadius.circular(14),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 2),
            // borderRadius: BorderRadius.circular(14),
          ),
          // filled: true,
          // fillColor: Colors.blueAccent,
        ),
        validator: (value) => value == null ? "Select a category" : null,
        // dropdownColor: Colors.blueAccent,
        value: selectedType,
        onChanged: (String? newValue) {
          setState(() {
            selectedType = newValue!;
          });
        },
        items: dropdownItems);
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Text("Looking for work"), value: "Looking for work"),
      DropdownMenuItem(
          child: Text("Looking for service"), value: "Looking for service"),
    ];
    return menuItems;
  }
}
