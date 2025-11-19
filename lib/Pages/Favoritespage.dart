import 'package:flutter/material.dart';

class Favoritespage extends StatelessWidget {
  const Favoritespage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites Page'),
      ),
      body: Center(
        child: Text('This is the Favorites Page'),
      ),
    );
  }
  
}