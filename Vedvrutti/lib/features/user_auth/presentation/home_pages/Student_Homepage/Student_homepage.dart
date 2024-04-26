import 'package:flutter/material.dart';
import 'package:flutter_firebase/features/user_auth/presentation/home_pages/Student_Homepage/profile_page.dart';
import 'news_page.dart';
import 'store_page.dart';
import 'community_page.dart';

class StudentHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "VEDVRITTI",
          style: TextStyle(
            fontFamily:
                'YourFontFamily', // Change this to the desired font family
            fontSize: 24, // Change this to the desired font size
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Trending books section
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Trending Books",
              style: TextStyle(
                fontFamily:
                    'YourFontFamily', // Change this to the desired font family
                fontSize: 22, // Change this to the desired font size
              ),
            ),
          ),

          // Varieties of books section
          SizedBox(height: 220),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Varieties of Books",
              style: TextStyle(
                fontFamily:
                    'YourFontFamily', // Change this to the desired font family
                fontSize: 22, // Change this to the desired font size
                // fontWeight: FontWeight.bold, // Add this line if you want bold text
              ),
            ),
          ),

          SizedBox(height: 220),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],

        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        // Set the background color for the entire BottomNavigationBar
        backgroundColor: Colors.white,
        // Add navigation logic here
        onTap: (index) {
          // Handle navigation based on the index
          if (index == 0) {
            // Navigate to Home
            // Replace this logic with your home page navigation
          } else if (index == 1) {
            // Navigate to NewsPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewsPage()),
            );
          } else if (index == 2) {
            // Navigate to StorePage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyBookStore()),
            );
          } else if (index == 3) {
            // Navigate to CommunityPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CommunityPage()),
            );
            // Replace this logic with your CommunityPage page navigation
          } else if (index == 4) {
            // Navigate to Profile
            print("Navigating to ProfileSection");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
            print("Welcome to Profile Section");
            // Replace this logic with your profile page navigation
          }
        },
      ),
    );
  }
}
