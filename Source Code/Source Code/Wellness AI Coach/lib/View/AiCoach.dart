import 'package:flutter/material.dart';

class AICoach extends StatefulWidget {
  @override
  _AICoachState createState() => _AICoachState();
}

class _AICoachState extends State<AICoach> {
  List<Map<String, dynamic>> messages = [
    {"text": "I am an AI Wellness Coach.", "isSentByUser": false},
    {"text": "How can I help you today?", "isSentByUser": false}
  ];
  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        messages.add({
          "text": _messageController.text,
          "isSentByUser": true,
        });

        // Simulate AI response
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            messages.add({
              "text": "Here is a suggestion based on your input.",
              "isSentByUser": false,
            });
          });
        });
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE0F7F4),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color(0xFFE0F7FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Color(0xFF5AA9E6), Color(0xFF92C6E7)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 15,
                            offset: Offset(5, 5),
                          ),
                        ],
                      ),
                    ),
                    const CircleAvatar(
                      radius: 65,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person,
                          size: 80, color: Colors.blueAccent),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'AI Wellness Coach',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildIconButton(Icons.eco),
                    buildIconButton(Icons.favorite),
                    buildIconButton(Icons.settings),
                  ],
                ),
                const SizedBox(height: 10),
                buildNeumorphicButton('AI Wellness Coach', Colors.blue),
                buildNeumorphicButton('AI Habit Coach', Colors.lightBlue),
                const SizedBox(height: 10),
                // Chat section with dynamic messages
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return buildChatBubble(messages[index]["text"],
                        isSentByUser: messages[index]["isSentByUser"]);
                  },
                ),
                buildInputSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIconButton(IconData icon) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.white,
      foregroundColor: Colors.grey[300],
      child: Icon(
        icon,
        size: 30,
        color: Colors.blueAccent,
      ),
    );
  }

  Widget buildNeumorphicButton(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
              offset: Offset(5, 5),
            ),
            BoxShadow(
              color: Colors.white.withOpacity(0.7),
              blurRadius: 15,
              offset: const Offset(-5, -5),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildChatBubble(String text, {bool isSentByUser = false}) {
    return Align(
      alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: isSentByUser ? Colors.blueAccent : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: isSentByUser ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget buildInputSection() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, top: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey[500], fontSize: 16),
                ),
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: _sendMessage,
            child: const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.send, size: 30, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
