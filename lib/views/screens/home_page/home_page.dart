import 'package:flutter/material.dart';
import 'package:player/views/screens/song_homePage/song_homePage.dart';

import '../video_Page/video_Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, value) => [
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            title: const Text("Media Booster"),
            bottom: TabBar(
              controller: tabController,
              tabs: const [
                Tab(
                  text: "Songs",
                ),
                Tab(
                  text: "Videos",
                ),
              ],
            ),
          ),
        ],
        body: TabBarView(
          controller: tabController,
          children: const [
            SongHomePage(),
            VideoPage(),
          ],
        ),
      ),
    );
  }
}
