///Use of [useAppLifecycleState]

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_/sections/future_ex.dart';

class LifeCycleSecurityExample extends HookWidget {
  static const routeName = '/life_cycle_security';
  const LifeCycleSecurityExample({super.key});

  @override
  Widget build(BuildContext context) {
    final state = useAppLifecycleState();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Life Cycle Security Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Opacity(
              opacity: state == AppLifecycleState.resumed ? 1 : 0,
              child: Image.network(url),
            ),
          ],
        ),
      ),
    );
  }
}
