import 'package:flutter/material.dart';

class TextBox extends StatefulWidget {
  final String type;

  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const TextBox({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.validator,
    required this.type,
  }) : super(key: key);

  @override
  _TextBoxState createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.type == 'password'
          ? isObscure
              ? false
              : true
          : false,
      keyboardType:
          widget.type == 'number' ? TextInputType.number : TextInputType.name,
      decoration: InputDecoration(
          suffixIcon: widget.type == 'password'
              ? isObscure
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: Icon(Icons.visibility),
                      color: Theme.of(context).primaryColor,
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: Icon(Icons.visibility_off),
                      color: Theme.of(context).primaryColor,
                    )
              : SizedBox(),
          // filled: true,
          fillColor: Colors.grey,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          hintText: widget.hintText,
          border: const OutlineInputBorder()),
    );
  }
}
