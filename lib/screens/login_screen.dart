import 'package:flutter/material.dart';
import 'package:flutter_application_university/widgets/background_widget.dart';
import 'package:flutter_application_university/widgets/login_widget.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          BackgroundWdiget(),
          LoginWidget(),
        ],
      ),
    );
  }
}