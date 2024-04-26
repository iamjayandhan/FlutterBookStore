import 'package:flutter/material.dart';

class RenownedAuthorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Renowned Authors\' Books'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Renowned Authors\' Books Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Add your UI for renowned authors' books here
          ],
        ),
      ),
    );
  }
}
