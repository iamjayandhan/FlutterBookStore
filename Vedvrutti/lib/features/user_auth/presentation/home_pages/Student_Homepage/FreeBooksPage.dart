import 'package:flutter/material.dart';

class FreeBooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Free Books'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Free Books Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Add your UI for free books here
          ],
        ),
      ),
    );
  }
}
