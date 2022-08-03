import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:trips_iu/Widget/TextField.dart';
import 'package:trips_iu/models/user.dart';
import 'package:trips_iu/providers/auth_provider.dart';
import 'package:trips_iu/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  final _username = TextEditingController();
  final _password = TextEditingController();

  bool T_or_F = false;
  bool shownPassword = true;
  String hintText = "Password";
  var myIcone = Icon(Icons.password);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sign Up"),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //************SignUp: username************//
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
                },
                child: Text("SignUp"))
          ],
        ),
      ),
    );
  }
}
