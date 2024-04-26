import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String email;
  final String educationalStream;
  //final int age;

  UserProfilePage({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.educationalStream,
    //required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: $name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Phone Number: $phoneNumber',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Email: $email',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Educational Stream: $educationalStream',
              style: TextStyle(fontSize: 18),
            ),
            //SizedBox(height: 10),

            // Add more information as needed

            // Add your UI for additional user profile information here
          ],
        ),
      ),
    );
  }
}
