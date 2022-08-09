import 'package:flutter_hooks_/main.dart';
import './sections/sections.dart';

final routes = {
  '/': (context) => const MyHomePage(),
  TextControllerEx.routeName: (context) => const TextControllerEx(),
  PeriodicStreamEx.routeName: (context) => const PeriodicStreamEx(),
  FutureExample.routeName: (context) => const FutureExample(),
  CountDownExample.routeName: (context) => const CountDownExample(),
  ImageFadeScrollExample.routeName: (context) => const ImageFadeScrollExample(),
  ImageRotationExample.routeName: (context) => const ImageRotationExample(),
  ReducerExample.routeName: (context) => const ReducerExample(),
  LifeCycleSecurityExample.routeName: (context) =>
      const LifeCycleSecurityExample(),
};
