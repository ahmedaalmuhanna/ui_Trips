import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trips_iu/Widget/TextField.dart';

import 'package:trips_iu/models/user.dart';
import 'package:trips_iu/providers/auth_provider.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  final _username = TextEditingController();
  final _password = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sign In"),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myTextField(
                textField: _username,
                hintText: 'Username',
                myIcone: Icon(Icons.person),
                isPassword: false),
            SizedBox(
              height: 10,
            ),
            //************SignUp: password************//
            myTextField(
                textField: _password,
                hintText: 'Password',
                myIcone: Icon(Icons.password),
                isPassword: true),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<AuthProvider>().signUp(
                      User(username: _username.text, password: _password.text));
                  context.push("/Homepage");
                },
                child: Text("Sign in")),
            TextButton(
                onPressed: () {
                  context.read<AuthProvider>().signIn(
                      User(username: _username.text, password: _password.text));
                  context.push("/SignUpPage");
                },
                child: Text("Creat an Account")),
          ],
        ),
      ),
    );
  }
}
