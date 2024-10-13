import 'package:aicoach/View/AddHabit.dart';
import 'package:aicoach/View/Profile.dart';
import 'package:aicoach/View/Setting.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD8F3F8),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome, Sufiyan!',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              buildStreaksProgress(),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildCircularProgress(
                      'Daily Steps', Icons.directions_walk, 0.75),
                  buildCircularProgress('Sleep Duration', Icons.bed, 0.8),
                  buildCircularProgress('Water Intake', Icons.local_drink, 0.6),
                ],
              ),
              const SizedBox(height: 200),
              buildBottomNavBar(context),
            ],
          ),
        ),
      ),
    );
  }

  // Build the streaks progress at the top
  Widget buildStreaksProgress() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildDailyStatistic('2.2%', 'Daily'),
        buildLargeCircularProgress('70%', 'Goal Progress'),
        Column(
          children: [
            buildDailyStatistic('3 Days', 'Streak'),
            const Icon(Icons.emoji_events,
                color: Colors.orangeAccent, size: 30),
          ],
        ),
      ],
    );
  }

  Widget buildDailyStatistic(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget buildLargeCircularProgress(String value, String label) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: CircularProgressIndicator(
                value: 0.7,
                strokeWidth: 12,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                backgroundColor: Colors.blue.withOpacity(0.2),
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget buildCircularProgress(String label, IconData icon, double value) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: CircularProgressIndicator(
                value: value,
                strokeWidth: 8,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                backgroundColor: Colors.blue.withOpacity(0.2),
              ),
            ),
            Icon(
              icon,
              size: 35,
              color: Colors.blue,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget buildBottomNavBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildNavItem(context, Icons.home, 'Home', HomeScreen(),
              isActive: true),
          buildNavItem(context, Icons.flag, 'Habits', AddHabitScreen()),
          buildNavItem(context, Icons.person, 'Profile', ProfileSetupScreen()),
          buildNavItem(
              context, Icons.settings, 'Settings', AccountSettingsScreen()),
        ],
      ),
    );
  }

  Widget buildNavItem(
      BuildContext context, IconData icon, String label, Widget destination,
      {bool isActive = false}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Column(
        children: [
          Icon(
            icon,
            size: 30,
            color: isActive ? Colors.blue : Colors.black54,
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: isActive ? Colors.blue : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
