import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:player/utils/video_list.dart';

import 'package:provider/provider.dart';

import '../../../controllers/video_controller.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<VideoController>(
      builder: (context, provider, child) => Center(
        child: provider.videoPlayerController.value.isInitialized
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Consumer<CarouselSliderController>(
                    builder: (context, cProvider, child) => Column(
                      children: [
                        CarouselSlider(
                          items: [
                            AspectRatio(
                              aspectRatio: provider
                                  .videoPlayerController1.value.aspectRatio,
                              child: Chewie(
                                controller: provider.chewieController1,
                              ),
                            ),
                            AspectRatio(
                              aspectRatio: provider
                                  .videoPlayerController2.value.aspectRatio,
                              child: Chewie(
                                controller: provider.chewieController2,
                              ),
                            ),
                          ],
                          options: CarouselOptions(
                            autoPlay: false,
                            enlargeCenterPage: true,
                            autoPlayCurve: Curves.easeOut,
                            onPageChanged: (index, reason) {
                              cProvider.onPageChange(index: index);
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            2,
                            (index) => Container(
                              margin: const EdgeInsets.all(2),
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: cProvider.currentIndex == index
                                    ? Colors.green
                                    : Colors.grey.shade500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  AspectRatio(
                    aspectRatio:
                        provider.videoPlayerController.value.aspectRatio,
                    child: Chewie(
                      controller: provider.chewieController,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Videos",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      itemCount: allVideos.length,
                      itemBuilder: (context, index) => Card(
                        child: ListTile(
                          onTap: () {
                            provider.changeCurrentIndex(currentIndex: index);
                          },
                          title: Text(allVideos[index]['title']!),
                          leading: Image.network(allVideos[index]['image']!),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
