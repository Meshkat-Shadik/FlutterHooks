///Use of [useMemoized] and [useListenable]

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CountDownExample extends HookWidget {
  static const routeName = '/countdown_ex';
  const CountDownExample({super.key});

  @override
  Widget build(BuildContext context) {
    final countDown = useMemoized(() => CountDown(from: 20));
    final notifier = useListenable(countDown);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Countdown Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              notifier.value.toString(),
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

class CountDown extends ValueNotifier<int> {
  late StreamSubscription sub;
  CountDown({required int from}) : super(from) {
    sub = Stream.periodic(const Duration(seconds: 1), (v) => from - v)
        .takeWhile((y) => y >= 0)
        .listen(
          (x) => value = x,
        ); //value is a property of ValueNotifier class iteself (not a property of CountDown class)
  }
  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }
}
