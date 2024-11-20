import 'package:emindcare/demo.dart';
import 'package:emindcare/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:emindcare/chat_bot.dart'; // Import the chatbot screen


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Generate some data (you can expand this logic)
                // Navigator.push(
                //   context,
                //  MaterialPageRoute(builder: (context) =>  BlogPage()),
                // );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Data Generated')),
                );
              },
              child: const Text('Generate Data'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the chatbot screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatBotScreen()),
                );
              },
              child: const Text('Go to Chatbot'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the login screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Set the button color to red
              ),
              child: const Text('Back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}