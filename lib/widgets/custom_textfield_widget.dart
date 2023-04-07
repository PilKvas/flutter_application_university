import 'package:flutter/material.dart';
import 'package:flutter_application_university/app_colors.dart';



class CustomTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;
  final bool obscureText;
  final String? hintText;
  final Widget? suffixIcon;
  
  const CustomTextFormField({Key? key, this.validator, this.controller, required this.obscureText, this.hintText, this.suffixIcon, this.onFieldSubmitted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
                  onFieldSubmitted:     onFieldSubmitted,
                  validator: validator,
                  controller: controller,
                  obscureText: obscureText,
                  style: const TextStyle(color: AppColors.textFieldColor),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding: const EdgeInsets.only(
                        left: 17.74,
                        top: 12,
                        bottom: 12.15,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color:Color.fromRGBO(139, 41, 244, 1)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder:  const OutlineInputBorder(
                        borderSide: BorderSide(color:Color.fromRGBO(104, 42, 245, 1)),
                      ),
                      hintText: hintText,
                      hintStyle: const TextStyle(
                        color: AppColors.textFieldColor,
                        fontSize: 14,
                        fontFamily: "Nunito",
                        letterSpacing: -0.3,
                      ),
                      suffixIcon: suffixIcon,
                ),
    );
  }
}