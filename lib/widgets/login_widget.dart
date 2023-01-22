import 'package:flutter/material.dart';
import 'package:flutter_application_university/app_colors.dart';
import 'package:flutter_svg/svg.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool _passwordVisible = false;

  void _changeVisibility() {
    setState((){
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 115),
              SvgPicture.asset("assets/svgg.svg"),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: const [
                  Text(
                    "Hey,",
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
                    "Login now.",
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
                height: 70,
              ),
              SizedBox(
                width: 327,
                height: 46,
                child: TextField(
                  style: const TextStyle(color: AppColors.textFieldColor),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.textFieldBackground,
                    contentPadding: const EdgeInsets.only(
                      left: 17.74,
                      top: 12,
                      bottom: 12.15,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Login",
                    hintStyle: const TextStyle(
                      color: AppColors.textFieldColor,
                      fontSize: 14,
                      fontFamily: "Nunito",
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              SizedBox(
                width: 327,
                height: 46,
                child: TextField(
                  obscureText: !_passwordVisible,
                  style: const TextStyle(color: AppColors.textFieldColor),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.textFieldBackground,
                      contentPadding: const EdgeInsets.only(
                        left: 17.74,
                        top: 12,
                        bottom: 12.15,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Password",
                      hintStyle: const TextStyle(
                        color: AppColors.textFieldColor,
                        fontSize: 14,
                        fontFamily: "Nunito",
                        letterSpacing: -0.3,
                      ),
                      suffixIcon: IconButton(
                        onPressed: _changeVisibility,
                        icon: Icon(_passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility_off,
                            color: Colors.white),
                      )),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Container(
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
                    "Sign in",
                    style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.3,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Sign up",
                style: TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.3,
                    color: AppColors.textFieldColor),
              )
            ],
          ),
        ),
      ],
    );
  }
}
