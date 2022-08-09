///Use of [useAnimationController] and [useScrollController]

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_/extensions/value_normalize_x.dart';
import 'package:flutter_hooks_/sections/sections.dart';

class ImageFadeScrollExample extends HookWidget {
  static const routeName = '/image_fade_scroll';
  const ImageFadeScrollExample({super.key});

  final double imageHeight = 300;

  @override
  Widget build(BuildContext context) {
    final opacity = useAnimationController(
      duration: const Duration(seconds: 1),
      initialValue: 1.0,
      lowerBound: 0.0,
      upperBound: 1.0,
    );
    final size = useAnimationController(
      duration: const Duration(seconds: 1),
      initialValue: 1.0,
      lowerBound: 0.0,
      upperBound: 1.0,
    );
    final scrollController = useScrollController();

    useEffect(() {
      scrollController.addListener(() {
        final newOpacity = max(imageHeight - scrollController.offset, 0.0);
        final normalized = newOpacity.normalized(0.0, imageHeight).toDouble();
        opacity.value = normalized;
        size.value = normalized;
      });
      return null;
    }, [scrollController]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Fade Scroll Example'),
      ),
      body: Column(
        children: [
          SizeTransition(
            sizeFactor: size,
            axis: Axis.vertical,
            axisAlignment: -1.0,
            child: FadeTransition(
              opacity: opacity,
              child: Image.network(
                url,
                height: imageHeight,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemBuilder: (context, index) => ListTile(
                title: Text('Item ${index + 1}'),
              ),
              itemCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}
