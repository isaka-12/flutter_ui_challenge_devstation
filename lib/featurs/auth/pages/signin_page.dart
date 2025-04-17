//signin page
import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        //STYLED APP BAR JUST SHAPE NO TEXT
        title: const Text('Sign In'),
        elevation: 0,

       
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Center(
            child: Text(
              'Welcome Back',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}