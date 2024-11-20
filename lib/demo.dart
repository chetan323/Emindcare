// import 'package:flutter/material.dart';
// // import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher_android/url_launcher_android.dart';
//
// class BlogApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BlogPage(),
//     );
//   }
// }
//
// class BlogPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Blog Page'),
//           bottom: TabBar(
//             tabs: [
//               Tab(text: 'Article'),
//               Tab(text: 'YouTube'),
//               Tab(text: 'Games'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             // Article Tab with local assets and clickable links
//             ArticleTab(),
//             // Placeholder content for YouTube and Games tabs
//             Center(child: Text('YouTube content goes here')),
//             Center(child: Text('Games content goes here')),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ArticleTab extends StatelessWidget {
//   final List<Article> articles = [
//     Article(
//       title: 'Flutter Development',
//       imageUrl: 'assets/loginimage.jpeg', // Local image asset
//       url: Uri.parse('https://flutter.dev'),
//     ),
//     Article(
//       title: 'Dart Language',
//       imageUrl: 'assets/loginimage.jpeg', // Local image asset
//       url: Uri.parse('https://www.healthline.com/fitness'),
//     ),
//     // Add more articles as needed
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: articles.length,
//       itemBuilder: (context, index) {
//         final article = articles[index];
//         return Card(
//           margin: EdgeInsets.all(10),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     // Using local image assets with error handling
//                     Image.asset(
//                       article.imageUrl,
//                       width: 100,
//                       height: 100,
//                       fit: BoxFit.cover,
//                       errorBuilder: (context, error, stackTrace) {
//                         return Container(
//                           width: 100,
//                           height: 100,
//                           color: Colors.grey,
//                           child: Icon(Icons.error, color: Colors.red),
//                         );
//                       },
//                     ),
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             article.title,
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 10),
//                           GestureDetector(
//                             onTap: () => _launchURL(context, article.url), // Open URL with context
//                             child: Text(
//                               'Read more',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.blue,
//                                 decoration: TextDecoration.underline,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   // Function to open a URL in the external browser with error handling and BuildContext
//   void _launchURL(BuildContext context, Uri url) async {
//     try {
//       if (await canLaunchUrl(url)) {
//         await launchUrl(
//           url,
//           mode: LaunchMode.externalApplication, // Open in external browser
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Could not launch URL: $url')),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: $e')),
//       );
//     }
//   }
// }
//
// class Article {
//   final String title;
//   final String imageUrl;
//   final Uri url;
//
//   Article({required this.title, required this.imageUrl, required this.url});
// }
