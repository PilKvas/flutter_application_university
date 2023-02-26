import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_university/widgets/background_widget.dart';
import 'package:flutter_application_university/widgets/custom_textfield_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;


  void onSelectedTab(int index){
    if(_selectedTab == index) return;
    setState((){
      _selectedTab = index;
    });
  }
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomTextFormField(hintText: "Serch", obscureText: false,),
      ),
      body: Stack(
        children:[
          BackgroundWidget(),
          
          Center(child: MaterialButton(onPressed: (){FirebaseAuth.instance.signOut();}, color:Colors.white)),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigationBar(
                  elevation: 0,
                  backgroundColor: const Color(0x00ffffff),
                  onTap: onSelectedTab,
                  currentIndex: _selectedTab,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Color.fromRGBO(222, 198, 252, 1),
                  items: [
            const BottomNavigationBarItem(icon: Icon(Icons.search_rounded, size: 40.0,), label: ' ',),
            BottomNavigationBarItem(icon: SvgPicture.asset("assets/svgg.svg", width: 60, height: 60), label: ' '),
            const BottomNavigationBarItem(icon: Icon(Icons.person_outlined, size: 40.0), label: ' '),
                  ],
                ),
          ),
        ]
      ),
    );
  }
}
