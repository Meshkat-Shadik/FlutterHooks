///Use of [useReducer]

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum Action {
  rotateLeft,
  rotateRight,
  moreVisible,
  lessVisible,
  increseSize,
  decreaseSize,
}

@immutable
class State {
  final double rotationDeg;
  final double alpha;
  final double size;

  const State({
    required this.rotationDeg,
    required this.alpha,
    required this.size,
  });

  const State.zero()
      : rotationDeg = 0.0,
        alpha = 1.0,
        size = 300;

  State rotateRight() => State(
        rotationDeg: (rotationDeg + 10.0),
        alpha: alpha,
        size: size,
      );
  State rotateLeft() => State(
        rotationDeg: (rotationDeg - 10.0),
        alpha: alpha,
        size: size,
      );
  State increaseAlpha() => State(
        rotationDeg: rotationDeg,
        alpha: min(alpha + 0.1, 1.0),
        size: size,
      );
  State decreaseAlpha() => State(
        rotationDeg: rotationDeg,
        alpha: max(alpha - 0.1, 0.1),
        size: size,
      );
  State increaseSize() => State(
        rotationDeg: rotationDeg,
        alpha: alpha,
        size: min(size + 10.0, 300.0),
      );
  State decreaseSize() => State(
        rotationDeg: rotationDeg,
        alpha: alpha,
        size: max(size - 10.0, 10.0),
      );
}

State reducer(State oldState, Action? action) {
  if (action == Action.rotateLeft) {
    return oldState.rotateLeft();
  } else if (action == Action.rotateRight) {
    return oldState.rotateRight();
  } else if (action == Action.moreVisible) {
    return oldState.increaseAlpha();
  } else if (action == Action.lessVisible) {
    return oldState.decreaseAlpha();
  } else if (action == Action.increseSize) {
    return oldState.increaseSize();
  } else if (action == Action.decreaseSize) {
    return oldState.decreaseSize();
  } else {
    return oldState;
  }
}

class ReducerExample extends HookWidget {
  static const routeName = '/reducer_ex';
  const ReducerExample({super.key});
  final url =
      'https://avatars.githubusercontent.com/u/31488481?s=400&u=773539b03edea382ba3c73b96b1a2663be26c218&v=4';

  @override
  Widget build(BuildContext context) {
    final store = useReducer<State, Action?>(
      reducer,
      initialState: const State.zero(),
      initialAction: null,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reducer Example'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.rotate_left),
                  onPressed: () {
                    store.dispatch(Action.rotateLeft);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.rotate_right),
                  onPressed: () {
                    store.dispatch(Action.rotateRight);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.brightness_high),
                  onPressed: () {
                    store.dispatch(Action.moreVisible);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.brightness_low),
                  onPressed: () {
                    store.dispatch(Action.lessVisible);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    store.dispatch(Action.increseSize);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    store.dispatch(Action.decreaseSize);
                  },
                ),
              ],
            ),
            const SizedBox(height: 150),
            Opacity(
              opacity: store.state.alpha,
              child: RotationTransition(
                turns: AlwaysStoppedAnimation(store.state.rotationDeg / 360.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: Image.network(
                    url,
                    height: store.state.size,
                    width: store.state.size,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
