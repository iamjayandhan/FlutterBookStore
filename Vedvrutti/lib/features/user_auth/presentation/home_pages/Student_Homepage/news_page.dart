import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Featured Section
            SectionWidget(
              title: 'Featured',
              children: [
                NewsItemWidget(
                  title: 'Breaking News: Important Event',
                  description: 'A brief description of the breaking news.',
                  onTap: () {
                    // Handle tap on this news item
                  },
                ),
                NewsItemWidget(
                  title: 'Exclusive Interview with Expert',
                  description: 'Insights from a leading industry expert.',
                  onTap: () {
                    // Handle tap on this news item
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Latest Educational Updates Section
            SectionWidget(
              title: 'Latest Educational Updates',
              children: [
                NewsItemWidget(
                  title: 'New Course Announcement',
                  description: 'Explore our latest course offerings.',
                  onTap: () {
                    // Handle tap on this news item
                  },
                ),
                NewsItemWidget(
                  title: 'Study Tips for Exam Preparation',
                  description:
                      'Get helpful tips for effective exam preparation.',
                  onTap: () {
                    // Handle tap on this news item
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Other Sections...
          ],
        ),
      ),
    );
  }
}

class SectionWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;

  SectionWidget({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        ...children,
      ],
    );
  }
}

class NewsItemWidget extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  NewsItemWidget({
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 2.0,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
