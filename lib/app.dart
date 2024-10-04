import 'package:flutter/material.dart';
import 'package:player/views/screens/home_page/home_page.dart';
import 'package:player/views/screens/song_detailsPage/song_detailPage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        brightness: Brightness.dark,
      ),
      routes: {
        '/': (context) => const HomePage(),
        'song_detail_page': (context) => const SongDetailPage(),
      },
    );
  }
}
