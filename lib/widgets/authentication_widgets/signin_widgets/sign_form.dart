import 'package:cooking_app/widgets/authentication_widgets/error.dart';

import 'package:flutter/material.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formkey = GlobalKey<FormState>();
  String username;
  String password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          buildUsernameFormField(),
          SizedBox(
            height: 20,
          ),
          buildPasswordFormField(),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Checkbox(
                  value: remember,
                  activeColor: Color(0xFFFF7643),
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                    });
                  }),
              Text("Remeber me"),
              Spacer(),
              GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Forgot pasword",
                    style: TextStyle(color:Color(0xff091D67),decoration: TextDecoration.underline),
                  )),
            ],
          ),
          FormError(errors: errors),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter your password");
        } else if (value.length >= 8) {
          removeError(error: "Password is too short");
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Please Enter your password");
          return "";
        } else if (value.length < 8) {
          addError(error: "Password is too short");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "password",
        suffixIcon: Icon(Icons.lock),
        hintText: "enter password",
        filled: true,
        fillColor: Color(0xFFFFECDF),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Color(0xFF757575),
          ),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Color(0xFF757575),
          ),
        ),
      ),
    );
  }

  TextFormField buildUsernameFormField() {
    return TextFormField(
      keyboardType: TextInputType.name,
      onSaved: (newValue) => username = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains("Please Enter your username")) {
          setState(() {
            errors.remove("Please Enter your username");
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains("Please Enter your username")) {
          setState(() {
            errors.add("Please Enter your username");
          });
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "username",
        hintText: "enter username",
        filled: true,
        fillColor: Color(0xFFFFECDF),
        suffixIcon: Icon(Icons.person),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Color(0xFF757575),
          ),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Color(0xFF757575),
          ),
        ),
      ),
    );
  }
}
