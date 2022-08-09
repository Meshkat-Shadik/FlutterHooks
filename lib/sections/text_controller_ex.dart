///Use of [useTextEditingController], [useEffect] and [useState]

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TextControllerEx extends HookWidget {
  static const String routeName = '/text_controller_ex';
  const TextControllerEx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();
    final text = useState('');
    useEffect(
      () {
        textController.addListener(() {
          text.value = textController.text;
        });
        return null;
      },
      [textController],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Editing Controller Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: textController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Type something',
                ),
              ),
              const SizedBox(height: 8),
              Text(
                text.value.isEmpty ? 'Type something to see here' : text.value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
