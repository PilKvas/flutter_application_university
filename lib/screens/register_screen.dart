import 'package:flutter/material.dart';
import 'package:flutter_application_university/app_colors.dart';

import 'package:flutter_application_university/widgets/background_widget.dart';
import 'package:flutter_application_university/widgets/custom_textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterScreen({Key? key, required this.showLoginPage})
      : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (_key.currentState!.validate() && isConfirmPassword()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } on FirebaseAuthException catch (e) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(e.message.toString()),
              );
            });
      }
    }
  }

  isConfirmPassword() {
    if (_confirmPasswordController.text.trim() ==
        _passwordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  bool _passwordVisible = false;

  void _changeVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const BackgroundWidget(),
        ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Form(
                key: _key,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 70),
                    Image.asset(
                      "assets/Lotus-Flower.png",
                      width: 200,
                      color: AppColors.textFieldColor,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: const [
                        Text(
                          "Hurry up,",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.3,
                            fontFamily: "Nunito",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Text(
                          "Join our community.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.3,
                            fontFamily: "Nunito",
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                      controller: _emailController,
                      hintText: 'Email',
                      obscureText: false,
                      validator: validateEmail,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      controller: _passwordController,
                      hintText: 'Password',
                      obscureText: !_passwordVisible,
                      validator: validatePassword,
                      suffixIcon: IconButton(
                        onPressed: _changeVisibility,
                        icon: Icon(
                            _passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      controller: _confirmPasswordController,
                      hintText: 'Confirm Password',
                      obscureText: !_passwordVisible,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Empty";
                        }
                        if (_passwordController.text.trim() !=
                            _confirmPasswordController.text.trim()) {
                          return "Not Match";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: signUp,
                      child: Container(
                        width: 327,
                        height: 46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(139, 41, 244, 1),
                                Color.fromRGBO(122, 42, 244, 1),
                                Color.fromRGBO(104, 42, 245, 1),
                                Color.fromRGBO(95, 42, 245, 1),
                              ]),
                        ),
                        child: const Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.3,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: widget.showLoginPage,
                          child: const Text(
                            "Already a member? Sign in",
                            style: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.3,
                                color: AppColors.textFieldColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return "E-mail address is required.";
  }

  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);

  if (!regex.hasMatch(formEmail)) {
    return "Invalid E-mail Address format.";
  }
  return null;
}

String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty) {
    return "Password is required";
  }

  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#/$&*~()a]).{8,}$';

  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formPassword)) {
    return '''
Password must ba at least 8 characters, 
include an uppercase letter, number and symbol
    ''';
  }
  return null;
}
