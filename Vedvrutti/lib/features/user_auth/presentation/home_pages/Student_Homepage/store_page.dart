import 'package:flutter/material.dart';
import 'FreeBooksPage.dart';
import 'RenownedAuthorsPage.dart';
import 'SuggestedBooksPage.dart';
import 'TopSellingBooksPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VEDVRITTI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyBookStore(),
    );
  }
}

class MyBookStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookstore'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Bookstore!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookstorePage()),
                );
              },
              child: Text('Go to Bookstore'),
            ),
          ],
        ),
      ),
    );
  }
}

class BookstorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookstore'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SectionCard(
            title: 'Top Selling Books',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TopSellingBooksPage()),
              );
              // Handle top-selling books navigation
              // You can navigate to a new page or show a list of top-selling books here
            },
          ),
          SectionCard(
            title: 'Free Books',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FreeBooksPage()),
              );
              // Handle free books navigation
              // You can navigate to a new page or show a list of free books here
            },
          ),
          SectionCard(
            title: 'Renowned Author\'s Books',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RenownedAuthorsPage()),
              );
              // Handle renowned author's books navigation
              // You can navigate to a new page or show a list of renowned author's books here
            },
          ),
          SectionCard(
            title: 'Suggested Books by NCISM',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SuggestedBooksPage()),
              );
              // Handle suggested books by NCISM navigation
              // You can navigate to a new page or show a list of suggested books here
            },
          ),
          // Add more sections as needed
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // Navigate back to the homepage
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const SectionCard({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title),
        onTap: onPressed,
      ),
    );
  }
}
