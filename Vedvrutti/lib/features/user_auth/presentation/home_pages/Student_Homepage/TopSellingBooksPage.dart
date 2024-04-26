import 'package:flutter/material.dart';

class TopSellingBooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Selling Books'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Top Selling Books Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Add your UI for top-selling books here
          ],
        ),
      ),
    );
  }
}
