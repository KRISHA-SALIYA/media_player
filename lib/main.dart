import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'controllers/audio_controller.dart';
import 'controllers/carosolsliser_controller.dart';
import 'controllers/video_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AudioController(),
        ),
        ChangeNotifierProvider(
          create: (context) => VideoController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CarouselSliderController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
