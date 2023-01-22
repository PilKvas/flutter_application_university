import 'package:flutter/material.dart';
import 'package:flutter_application_university/app_colors.dart';

class BackgroundWdiget extends StatelessWidget {
  const BackgroundWdiget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Container(
            alignment:
                Alignment.lerp(Alignment.centerRight, Alignment.topRight, 1),
            child: Image.asset("assets/Ellipse 1.png"),
          ),
          Container(
            alignment:
                Alignment.lerp(Alignment.center, Alignment.centerLeft, 1),
            child: Image.asset("assets/Ellipse 5.png"),
          ),
          Container(
            alignment:
                Alignment.lerp(Alignment.centerLeft, Alignment.bottomLeft, 1),
            child: Image.asset("assets/Ellipse 3.png"),
          ),
          Container(
            alignment:
                Alignment.lerp(Alignment.centerRight, Alignment.bottomRight, 1),
            child: Image.asset("assets/Ellipse 4.png"),
          ),
        ],
      ),
    );
  }
}
