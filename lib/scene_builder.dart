import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:obs_websocket/obs_websocket.dart';

typedef ObsConfig = ({
  String url,
  String password,
});

typedef SceneWidgetBuilder = Widget Function(
  BuildContext context,
  String? name,
);

class SceneBuilder extends StatefulWidget {
  const SceneBuilder({
    super.key,
    required this.config,
    required this.builder,
  });

  final ObsConfig config;
  final SceneWidgetBuilder builder;

  @override
  State<SceneBuilder> createState() => _SceneBuilderState();
}

class _SceneBuilderState extends State<SceneBuilder> {
  String? currentSceneName;
  ObsWebSocket? obsWebSocket;

  @override
  void initState() {
    super.initState();
    connect();
  }

  void connect() async {
    obsWebSocket = await ObsWebSocket.connect(widget.config.url,
        password: widget.config.password, fallbackEventHandler: (Event event) {
      if (event.eventType == 'CurrentProgramSceneChanged') {
        final sceneName = event.eventData?['sceneName'];
        if (sceneName is String) {
          final newScene = sceneName.toLowerCase();
          if (currentSceneName != newScene) {
            if (kDebugMode) {
              print('Scene changed to $newScene');
            }
            setState(() {
              currentSceneName = newScene;
            });
          }
        }
      }
    });
    if (kDebugMode) {
      print('Connected to OBS WebSocket');
    }

    var initialScene = await obsWebSocket?.scenes.getCurrentProgramScene();
    initialScene = initialScene?.toLowerCase();

    if (kDebugMode) {
      print('Initial scene: $initialScene');
    }
    await obsWebSocket?.listen(EventSubscription.scenes.code);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        currentSceneName = initialScene;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: KeyedSubtree(
        key: ValueKey(currentSceneName),
        child: widget.builder(context, currentSceneName),
      ),
    );
  }
}
