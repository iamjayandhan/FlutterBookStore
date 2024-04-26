import 'package:flutter/material.dart';

class SuggestedBooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suggested Books by NCISM'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Suggested Books by NCISM Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Add your UI for suggested books by NCISM here
          ],
        ),
      ),
    );
  }
}
