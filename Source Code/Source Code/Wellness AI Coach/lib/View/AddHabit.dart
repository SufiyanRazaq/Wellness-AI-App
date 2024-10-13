import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddHabitScreen extends StatefulWidget {
  @override
  _AddHabitScreenState createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  // Simulate progress percentage for each habit
  List<double> habitProgress = List.generate(8, (index) => index * 0.1);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth / 100).floor();

    return Scaffold(
      backgroundColor: const Color(0xFFE0F7F4),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Habit Water',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              // Progress bar
              Container(
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF66E6A3),
                      Color(0xFF3AC7B1),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Habits',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              // Habits Grid with interaction
              Expanded(
                child: GridView.builder(
                  itemCount: habitProgress.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          // Simulate marking the habit as complete
                          habitProgress[index] += 0.1;
                          if (habitProgress[index] > 1.0) {
                            habitProgress[index] =
                                1.0; // Cap the progress at 100%
                          }
                        });
                        if (kDebugMode) {
                          print("Habit $index marked as complete");
                        }
                      },
                      child: buildHabitTile(
                        'Drink Water',
                        '${(habitProgress[index] * 100).toStringAsFixed(0)}%',
                        Icons.local_drink,
                        habitProgress[index],
                        const Color(0xFF98E7B8),
                      ),
                    );
                  },
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    if (kDebugMode) {
                      print("Add Habit button pressed");
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 80),
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
                    child: const Text(
                      'Add Habit',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Padding below the button
            ],
          ),
        ),
      ),
    );
  }

  // Habit Tile Widget with progress
  Widget buildHabitTile(String habitName, String percentage, IconData icon,
      double progress, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 6,
                valueColor: AlwaysStoppedAnimation<Color>(color),
                backgroundColor: color.withOpacity(0.2),
              ),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: color,
              child: Icon(
                icon,
                size: 25,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          habitName,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
          ),
        ),
        Text(
          percentage,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
