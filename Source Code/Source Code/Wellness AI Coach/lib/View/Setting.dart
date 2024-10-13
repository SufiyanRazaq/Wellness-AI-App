import 'package:aicoach/View/AiCoach.dart';
import 'package:aicoach/View/TipsScreen.dart';
import 'package:aicoach/View/login.dart';
import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatefulWidget {
  @override
  _AccountSettingsScreenState createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  // Slider values
  double notificationsValue = 0.7;
  double privacyLevelValue = 0.5;
  double securitySettingsValue = 0.9;
  double brightnessValue = 0.8;

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
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFE0F7FA), Color(0xFFB2EBF2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildLeftSide(context), // Passing context here
                buildRightSide(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLeftSide(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blueAccent.withOpacity(0.1),
            child: const Icon(Icons.person_outline,
                size: 60, color: Colors.blueAccent),
          ),
          const SizedBox(height: 10),
          const Text(
            'Sufiyan',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Active',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AICoach(),
                  ),
                );
              },
              child: buildMenuOption('Ai Coach', Icons.person, true)),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WellnessTipsScreen(),
                  ),
                );
              },
              child: buildMenuOption('Tips', Icons.tips_and_updates, false)),
          buildMenuOption('Privacy', Icons.privacy_tip_outlined, false),
          buildMenuOption('Security', Icons.security_outlined, false),
          const Spacer(),
          GestureDetector(
            onTap: () {
              _showLogoutConfirmation(context);
            },
            child: buildNeumorphicButton('Log Out', Colors.redAccent),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget buildRightSide() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Account Settings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            const Spacer(),
            buildSliderOption('Notifications', notificationsValue,
                (value) => setState(() => notificationsValue = value)),
            buildSliderOption('Privacy Level', privacyLevelValue,
                (value) => setState(() => privacyLevelValue = value)),
            buildSliderOption('Security Settings', securitySettingsValue,
                (value) => setState(() => securitySettingsValue = value)),
            buildSliderOption('Brightness', brightnessValue,
                (value) => setState(() => brightnessValue = value)),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                _showSaveConfirmation(context);
              },
              child: buildNeumorphicButton('Save Changes', Colors.blueAccent),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildSliderOption(
      String label, double value, ValueChanged<double> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
        Slider(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.blueAccent,
          inactiveColor: Colors.blueAccent.withOpacity(0.3),
        ),
      ],
    );
  }

  Widget buildMenuOption(String text, IconData icon, bool active) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Container(
        decoration: BoxDecoration(
          color: active ? Colors.blue.withOpacity(0.2) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(5, 5),
            ),
            BoxShadow(
              color: Colors.white,
              blurRadius: 10,
              offset: Offset(-5, -5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.blueAccent,
                size: 18,
              ),
              const SizedBox(width: 15),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios_outlined,
                  size: 14, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNeumorphicButton(String text, Color color) {
    return Container(
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
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // Log out confirmation dialog
  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Log Out"),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Log Out"),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }

  // Save changes confirmation dialog
  void _showSaveConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Save"),
          content: const Text("Do you want to save the changes?"),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Save"),
              onPressed: () {
                Navigator.of(context).pop();
                // Add saving logic here
              },
            ),
          ],
        );
      },
    );
  }
}
