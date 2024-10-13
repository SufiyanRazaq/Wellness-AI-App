import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WellnessTipsScreen extends StatefulWidget {
  @override
  _WellnessTipsScreenState createState() => _WellnessTipsScreenState();
}

class _WellnessTipsScreenState extends State<WellnessTipsScreen> {
  // Simulate daily streaks
  int dailyStreak = 5; // Example streak count
  int selectedTipIndex = 0;

  // Tip content
  List<Map<String, String>> tips = [
    {
      'title': 'Drink 8 glasses of water today',
      'description': 'Stay hydrated by drinking water throughout the day.',
      'icon': 'local_drink'
    },
    {
      'title': 'Take a 10-minute walk',
      'description': 'Take short breaks and get some fresh air by walking.',
      'icon': 'directions_walk'
    },
    {
      'title': 'Get 7-8 hours of sleep',
      'description': 'Improve your sleep quality by going to bed early.',
      'icon': 'bedtime'
    },
    {
      'title': 'Stretch for 5 minutes',
      'description': 'Stretching improves flexibility and relieves tension.',
      'icon': 'accessibility'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F2F2),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildStreakHeader(),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: tips.map((tip) {
                    return buildTipCard(
                      tip['title']!,
                      tip['icon']!,
                      tip['description']!,
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    // Simulate cycling through personalized tips
                    selectedTipIndex = (selectedTipIndex + 1) % tips.length;
                    if (kDebugMode) {
                      print("Next tip button pressed");
                    }
                  });
                },
                child: Container(
                  width: 200,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFA18CD1), Color(0xFFFF9A9E)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(5, 5),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'NEXT TIP',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build the streak header with progress
  Widget buildStreakHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFF9A9E), Color(0xFFA18CD1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Text(
            'Daily Wellness Tips',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black26,
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Personal Wellness Tips',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Daily Streak: $dailyStreak Days',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // Build each tip card
  Widget buildTipCard(String title, String iconName, String description) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.purple.withOpacity(0.2),
            child: Icon(
              _getIconFromString(iconName),
              size: 25,
              color: Colors.purple,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  // Convert string to icon
  IconData _getIconFromString(String iconName) {
    switch (iconName) {
      case 'local_drink':
        return Icons.local_drink;
      case 'directions_walk':
        return Icons.directions_walk;
      case 'bedtime':
        return Icons.bedtime;
      case 'accessibility':
        return Icons.accessibility;
      default:
        return Icons.help_outline;
    }
  }
}
