import 'package:flutter/material.dart';

import 'package:flutter_application_university/widgets/background_widget.dart';

import 'package:flutter_application_university/widgets/listview_tab.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;

  void onSelectedTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  // final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("LotusMind"),
      ),
      body: Stack(children: [
        const BackgroundWidget(),
        IndexedStack(
          index: _selectedTab,
          children: const [
            ListViewTab(),
            Text("hello"),
            Text("hello"),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CurvedNavigationBar(
            index: 0,
            height: 70.0,
            items: <Widget>[
              const Icon(
                Icons.search,
                size: 35,
                color: Colors.white,
              ),
              Image.asset(
                "assets/Lotus-Flower.png",
                color: Colors.white,
                width: 40,
                height: 40,
              ),
              const Icon(
                Icons.person_outline,
                size: 35,
                color: Colors.white,
              ),
            ],
            color: const Color.fromRGBO(136, 77, 231, 1),
            buttonBackgroundColor: const Color.fromRGBO(136, 77, 231, 1),
            backgroundColor: Colors.transparent,
            animationDuration: const Duration(milliseconds: 500),
            onTap: onSelectedTab,
          ),
        ),
      ]),
    );
  }
}
