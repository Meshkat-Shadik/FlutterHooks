///Use of [useMemoized] and [useFuture]

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_/extensions/comapct_map_x.dart';

const url =
    'https://avatars.githubusercontent.com/u/31488481?s=400&u=773539b03edea382ba3c73b96b1a2663be26c218&v=4';

class FutureExample extends HookWidget {
  static const routeName = '/future_ex';
  const FutureExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final image = useFutureMem<Image>(
      () => NetworkAssetBundle(Uri.parse(url))
          .load(url)
          .then((value) => value.buffer.asUint8List())
          .then(
            (value) => Image.memory(value),
          ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Future Example')),
      body: Column(
        children: [
          const Text('Future Image Loading Example'),
          image.hasData ? image.data : const CircularProgressIndicator(),
          ElevatedButton(
            onPressed: () {},
            child: const Text('data'),
          )
        ].compactMap().toList(),
      ),
    );
  }
}
