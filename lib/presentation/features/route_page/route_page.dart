import 'package:flutter/material.dart';

class RoutePage extends StatelessWidget {
  const RoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: 'Characters'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Episodes'),
        ],
      ),
    );
  }
}
