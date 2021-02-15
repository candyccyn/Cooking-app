import 'package:cooking_app/screens/authenticate/error.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String username;
  String email;
  String password;
  String confirm_password;
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
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              buildUsernameFormField(),
              SizedBox(height: 30),
              buildEmailFormField(),
              SizedBox(height: 30),
              buildPasswordFormField(),
              SizedBox(height: 30),
              buildConfirmPasswordFormField(),
              FormError(errors: errors),
              SizedBox(height: 30),
              RaisedButton(
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Color(0xFFFF7643),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      //valid

                    }
                  }),
            ],
          ),
        ));
  }

  TextFormField buildUsernameFormField() {
    return TextFormField(
      onSaved: (newValue) => username = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter your username");
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Please Enter your username");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "username",
        hintText: "enter username",
        filled: true,
        fillColor: Color(0xFFFFECDF),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.person),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(30),
        //   borderSide: BorderSide(
        //     color: Color(0xFF757575),
        //   ),
        //   gapPadding: 10,
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(30),
        //   borderSide: BorderSide(
        //     color: Color(0xFF757575),
        //   ),
        // ),
      ),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirm_password = newValue,
      onChanged: (value) {
        if (password == confirm_password) {
          removeError(error: "Passwords don't match");
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          return "";
        } else if (password != value) {
          addError(error: "Passwords don't match");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFFFECDF),
        labelText: "Confirm password",
        hintText: "Re-entered a password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(30),
        //   borderSide: BorderSide(
        //     color: Color(0xFF757575),
        //   ),
        //   gapPadding: 10,
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(30),
        //   borderSide: BorderSide(
        //     color: Color(0xFF757575),
        //   ),
        // ),
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
        password = value;
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
        labelText: "Password",
        hintText: "enter a password",
        filled: true,
        fillColor: Color(0xFFFFECDF),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(30),
        //   borderSide: BorderSide(
        //     color: Color(0xFF757575),
        //   ),
        //   gapPadding: 10,
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(30),
        //   borderSide: BorderSide(
        //     color: Color(0xFF757575),
        //   ),
        // ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter your email");
        } else if (RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          removeError(error: "Please Enter Valid Email");
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Please Enter your email");
          return "";
        } else if (!(RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
            .hasMatch(value)) {
          addError(error: "Please Enter Valid Email");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFFFECDF),
        labelText: "Email",
        hintText: "enter an email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.mail),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(30),
        //   borderSide: BorderSide(
        //     color: Color(0xFF757575),
        //   ),
        //   gapPadding: 10,
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(30),
        //   borderSide: BorderSide(
        //     color: Color(0xFF757575),
        //   ),
        // ),
      ),
    );
  }
}
