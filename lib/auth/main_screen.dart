import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_university/auth/auth_screen.dart';
import 'package:flutter_application_university/screens/home_screen.dart';



class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return const HomeScreen();
          }else {
            return const AuthScreen();
          }
        }
      )
    );
  }
}