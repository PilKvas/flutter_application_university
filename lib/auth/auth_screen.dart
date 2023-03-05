import "package:flutter/material.dart";
import "package:flutter_application_university/screens/login_screen.dart";
import "package:flutter_application_university/screens/register_screen.dart";


class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool showLoginPage = true;

  void toggleScreens(){
    setState((){
          showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginScreen(showRegisterPage: toggleScreens,);
    }else{
      return RegisterScreen(showLoginPage: toggleScreens,);
    }
  }
}