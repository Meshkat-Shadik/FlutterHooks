import 'package:flutter/material.dart';
import 'package:flutter_hooks_/route.dart';
import './sections/sections.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Hooks'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, TextControllerEx.routeName);
              },
              child: const Text('Text Editing Controller Example'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PeriodicStreamEx.routeName);
              },
              child: const Text('Periodic Stream Example'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, FutureExample.routeName);
              },
              child: const Text('Future Example'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, CountDownExample.routeName);
              },
              child: const Text('CountDown Example'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ImageFadeScrollExample.routeName);
              },
              child: const Text('Image Fade on Scroll Example'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ImageRotationExample.routeName);
              },
              child: const Text('Image Rotation Example'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ReducerExample.routeName);
              },
              child: const Text('Reducer Example'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, LifeCycleSecurityExample.routeName);
              },
              child: const Text('LifeCycle Hook Example'),
            ),
          ],
        ),
      ),
    );
  }
}
