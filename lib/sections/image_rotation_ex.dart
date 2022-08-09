///Use of [useStreamController]

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ImageRotationExample extends HookWidget {
  static const routeName = '/image_rotation_ex';
  const ImageRotationExample({super.key});

  final url =
      'https://avatars.githubusercontent.com/u/31488481?s=400&u=773539b03edea382ba3c73b96b1a2663be26c218&v=4';

  @override
  Widget build(BuildContext context) {
    late final StreamController<double> controller;

    controller = useStreamController<double>(onListen: () {
      controller.sink.add(0.0);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Rotation Example'),
      ),
      body: Center(
        child: StreamBuilder<double>(
            stream: controller.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              } else {
                final rotation = snapshot.data ?? 0.0;
                return GestureDetector(
                  onTap: () {
                    controller.sink.add(rotation + 10.0);
                  },
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation(rotation / 360.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Image.network(
                        url,
                        height: 300,
                        width: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
