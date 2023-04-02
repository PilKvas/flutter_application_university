import 'package:flutter/material.dart';
import 'package:flutter_application_university/widgets/listview_tab.dart';

class TopicScreen extends StatelessWidget {
  final Item item;
  const TopicScreen({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Material(
            color: Colors.transparent,
            child: Hero(
                  tag: 'hero-tag-${item.title}',
                  child: Text(
            item.title,
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
            maxLines: 2,
                  ),
                ),
          )),
    );
  }
}
