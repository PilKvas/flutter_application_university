import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_university/auth/main_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
      theme: ThemeData(
        fontFamily: "Nunito",
        textTheme: const TextTheme(
          displayMedium: TextStyle(fontSize: 12.0, color: Colors.white),

        ),
      ),
    );
  }
}

