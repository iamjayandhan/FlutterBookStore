import 'package:flutter/material.dart';
import 'Upload_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vedvritti',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthorPage(),
    );
  }
}

class Author {
  final String name;
  final String education;
  final String experience;

  Author({
    required this.name,
    required this.education,
    required this.experience,
  });
}

class AuthorPage extends StatefulWidget {
  @override
  _AuthorPageState createState() => _AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    ProfilePage(
      author: Author(
        name: 'John Doe',
        education: 'Bachelor of Science in Computer Science',
        experience: '5 years of experience in software development',
      ),
    ),
    UploadPage(),
    FeedbackPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Author Page'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_upload),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback),
            label: 'Feedback',
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final Author author;

  ProfilePage({required this.author});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Profile Page',
            style: TextStyle(fontSize: 24.0),
          ),
          SizedBox(height: 20.0),
          Text(
            'Name: ${author.name}',
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            'Education: ${author.education}',
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            'Experience: ${author.experience}',
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Feedback Page',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
