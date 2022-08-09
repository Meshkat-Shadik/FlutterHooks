///Use of [useStream]

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../extensions/date_time_x.dart';

Stream<String> getTime() {
  return Stream.periodic(
    const Duration(seconds: 1),
    (_) => DateTime.now().formattedDate,
  );
}

class PeriodicStreamEx extends HookWidget {
  static const String routeName = '/periodic_stream_ex';
  const PeriodicStreamEx({super.key});

  @override
  Widget build(BuildContext context) {
    final time = useStream<String>(getTime());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Periodic Stream Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            time.data.toString(),
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
