import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Вы зашли под почтой ${user.email.toString()}',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 15,),
            MaterialButton(
               color: Color.fromRGBO(136, 77, 231, 1),
              child: Text("Выйти", style: TextStyle(fontSize: 15, color: Colors.white)),
              onPressed: () {
              FirebaseAuth.instance.signOut();
            })
          ],
        ),
      ),
    );
  }
}
