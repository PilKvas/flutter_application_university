import 'package:flutter/material.dart';
import 'package:flutter_application_university/widgets/listview_tab.dart';



class MyWidget1 extends StatelessWidget {
    Item item;
  MyWidget1({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(40, 7,82, 1),
        centerTitle: true,
        title: Column(
          children: [
            Text(item.title,style: TextStyle(color: Colors.white, fontSize: 20),),
                  SizedBox(height: 5,),
                  Text("Aвтор статьи: ${item.author}",style: TextStyle(color: Colors.white, fontSize: 20),),
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(40, 7,82, 1),
      body: Stack(
        children: [
          
          ListView(
            children: [
              
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(item.content, style: TextStyle(color: Colors.white, fontSize: 17),),
              ),
              // Row(
              //   children: [
              //     item
              //   ],
              // )
            ],
          )
        ],
      )
    );
  }
}