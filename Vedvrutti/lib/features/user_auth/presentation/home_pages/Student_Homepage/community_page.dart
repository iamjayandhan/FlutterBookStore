import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Community Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CommunityPage(),
    );
  }
}

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  String selectedGroup = '';

  void joinGroup(String group) {
    setState(() {
      selectedGroup = group;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GroupPage(group: selectedGroup),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Community Page',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => joinGroup('First Year'),
                  child: Text('Join First Year Group'),
                ),
                ElevatedButton(
                  onPressed: () => joinGroup('Second Year'),
                  child: Text('Join Second Year Group'),
                ),
                ElevatedButton(
                  onPressed: () => joinGroup('Third Year'),
                  child: Text('Join Third Year Group'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GroupPage extends StatefulWidget {
  final String group;

  GroupPage({required this.group});

  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  final TextEditingController _controller = TextEditingController();
  List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.group} Group Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${widget.group} Group Page',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('Welcome to the ${widget.group} group page!'),
          SizedBox(height: 20),
          Expanded(
            child: ChatPage(messages: messages),
          ),
          TypingBar(
            controller: _controller,
            onSendMessage: (message) {
              setState(() {
                messages.add(message);
              });
              _controller.clear();
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ChatPage extends StatelessWidget {
  final List<String> messages;

  ChatPage({required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(messages[index]),
        );
      },
    );
  }
}

class TypingBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSendMessage;

  TypingBar({required this.controller, required this.onSendMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Type your message...',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              String message = controller.text.trim();
              if (message.isNotEmpty) {
                onSendMessage(message);
              }
            },
          ),
        ],
      ),
    );
  }
}
