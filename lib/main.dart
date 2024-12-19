import 'package:aplay/controller/music_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MusicScreen(),
    );
  }
}

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MusicController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Music App',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 12,
          ),
          child: Column(
            children: [
              Text(
                'Your music',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Gap(8),
              Obx(
                () => Slider(
                  min: 0,
                  value: controller.currentPosition.value.inSeconds.toDouble(),
                  onChanged: (value) {
                    controller.seekTo(
                      Duration(seconds: value.toInt()),
                    );
                  },
                  max: controller.totalDuration.value.inSeconds.toDouble(),
                ),
              ),
              const Gap(12),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: ()=>controller.forwordincremment(),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  Obx(
                    () => ElevatedButton(
                      onPressed: () => controller.toggelplay(),
                      child: Text(controller.isPlay.value ? 'Pause' : 'Play'),
                    ),
                  ),
                  IconButton(
                      onPressed: ()=>controller.backincremment(),
                      icon: const Icon(Icons.arrow_forward_ios_outlined)),
                ],
              ),
              const Gap(12),
              Text(
                'Click',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Gap(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'backword Click',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Obx(
                    ()=> Text(
                      controller.backwordClick.value.toString(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'forword Click',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Obx(
                    ()=> Text(
                      controller.forwordClick.value.toString(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
