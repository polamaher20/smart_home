import 'dart:math';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.purple, Colors.pink],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: _page(),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _icon(),
            SizedBox(height: 50),
            _inputField("Username", usernameController),
            SizedBox(height: 20),
            _inputField("Password", passwordController, isPassword: true),
            SizedBox(height: 20),
            _loginBtn(),
            SizedBox(height: 20),
            _extraText(),
          ],
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.home,
        color: Colors.white,
        size: 150,
      ),
    );
  }

  Widget _inputField(String hintText, TextEditingController controller,
      {bool isPassword = false}) {
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: BorderSide(color: Colors.white),
    );

    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        border: border,
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }

  Widget _loginBtn() {
    return ElevatedButton(
      onPressed: () async {
        final Uri _url =
            Uri.parse('http://192.168.100.5:8080/demo/admin/login.php');
        if (await canLaunchUrl(_url)) {
          await launchUrl(_url);
        } else {
          throw 'Could not launch $_url';
        }
      },
      child: SizedBox(
        width: double.infinity,
        child: Text(
          'Sign in',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _extraText() {
    return Text(
      "Can't access your account?",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    );
  }
}
