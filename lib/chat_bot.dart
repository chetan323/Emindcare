// chatbot_screen.dart
import 'package:flutter/material.dart';
import 'package:ikchatbot/ikchatbot.dart';
import 'keyword_response.dart'; // Import the keyword response file

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatBotConfig = IkChatBotConfig(
      // Settings for the chatbot
      ratingIconYes: const Icon(Icons.star),
      ratingIconNo: const Icon(Icons.star_border),
      ratingIconColor: Colors.black,
      ratingBackgroundColor: Colors.white,
      ratingButtonText: 'Submit Rating',
      thankyouText: 'Thanks for your rating!',
      ratingText: 'Rate your experience:',
      ratingTitle: 'Thank you for using the chatbot!',
      body: 'This is a test email sent from Flutter and Dart.',
      subject: 'Test Rating',
      recipient: 'recipient@example.com',
      isSecure: false,
      senderName: 'Your Name',
      smtpUsername: 'Your Email',
      smtpPassword: 'your password',
      smtpServer: 'stmp.gmail.com',
      smtpPort: 587,
      sendIcon: const Icon(Icons.send, color: Colors.black),
      userIcon: const Icon(Icons.account_circle_outlined, color: Colors.white),
      botIcon: const Icon(Icons.android, color: Colors.white),
      botChatColor: const Color.fromARGB(255, 104, 0, 101),
      delayBot: 100,
      closingTime: 1,
      delayResponse: 1,
      userChatColor: const Color.fromARGB(255, 103, 0, 0),
      waitingTime: 1,
      keywords: keywords,
      responses: responses,
      backgroundColor: Colors.white,
      initialGreeting: "Hello! Welcome to EmindCareBot.\nHow can I assist you today?",
      defaultResponse: defaultResponse, // Use the default response from the file
      inputHint: 'Send a message',
      waitingText: 'Please wait...', backgroundImage: 'Asset/mentalheath.jpg', inactivityMessage: '', closingMessage: '', useAsset: true, backgroundAssetimage: '',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatbot'),
      ),
      body: ikchatbot(config: chatBotConfig),
    );
  }
}
