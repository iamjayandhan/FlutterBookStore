import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdminPage(),
    );
  }
}

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    ProfileTab(),
    CommitteeMembersTab(),
    UploadedBooksTab(),
    RejectedBooksTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Committee Members',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Uploaded Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cancel),
            label: 'Rejected Books',
          ),
        ],
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Tab'),
    );
  }
}

class CommitteeMembersTab extends StatelessWidget {
  final List<String> committeeMembers = [
    'John Doe',
    'Jane Smith',
    'Alice Johnson',
    // Add more members as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: committeeMembers.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(committeeMembers[index]),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    MemberDetailsPage(memberName: committeeMembers[index]),
              ),
            );
          },
        );
      },
    );
  }
}

class MemberDetailsPage extends StatelessWidget {
  final String memberName;

  MemberDetailsPage({required this.memberName});

  @override
  Widget build(BuildContext context) {
    // Here you can fetch the member's uploaded and rejected books based on memberName
    // For simplicity, let's assume we have some dummy data
    List<String> uploadedBooks = [
      'Book 1 by $memberName',
      'Book 2 by $memberName',
    ];
    List<String> rejectedBooks = [
      'Rejected Book 1 by $memberName',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('$memberName\'s Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Uploaded Books:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: uploadedBooks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(uploadedBooks[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Rejected Books:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: rejectedBooks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(rejectedBooks[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UploadedBooksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Uploaded Books Tab'),
    );
  }
}

class RejectedBooksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Rejected Books Tab'),
    );
  }
}
