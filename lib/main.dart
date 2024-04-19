import 'package:flutter/material.dart';
import 'package:obs_flutter_source/colors.dart';
import 'package:obs_flutter_source/screens.dart';

import 'scene_builder.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OBS',
      home: Scaffold(
        backgroundColor: background,
        body: SceneBuilder(
          config: (
            url: 'ws:...',
            password: '...',
          ),
          builders: {
            'waiting': (context, name) => const Waiting(),
            'chat': (context, name) => const Chat(),
            'ending': (context, name) => const Ending(),
          },
        ),
      ),
    );
  }
}
