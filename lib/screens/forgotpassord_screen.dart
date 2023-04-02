import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_application_university/app_colors.dart";
import "package:flutter_application_university/widgets/background_widget.dart";

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();



  Future passwordReset() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(context: context, builder: (context){
        return const AlertDialog(
          content: Text("Password reset link sent! Check your email"),
        );
      });
    } on FirebaseAuthException catch (e){
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
      ),
      body: Stack(
        children: [
          const BackgroundWidget(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const BackgroundWidget(),
                const Text(
                  "Enter your email to restore a password",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.3,
                    fontFamily: "Nunito",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 327,
                  height: 46,
                  child: TextField(
                    controller: _emailController,
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
                      hintText: "Email",
                      hintStyle: const TextStyle(
                        color: AppColors.textFieldColor,
                        fontSize: 14,
                        fontFamily: "Nunito",
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.deepPurple[200],
                  onPressed: passwordReset,
                  child: const Text("Resset Password",style: TextStyle(color: Colors.white,)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
