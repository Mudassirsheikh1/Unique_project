import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:unique_project/pages/login_page.dart';

import '../pages/register_page.dart';
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //iniially , show  the login page
  bool showLoginPage = true;
  void toggleScreens(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage) {
      return LoginPage(showRegisterPage:toggleScreens);
    }
    else{
      return RegisterPage(showLoginPage:toggleScreens );
    }
  }
}