import 'package:flutter/widgets.dart';
import 'package:obs_flutter_source/colors.dart';

class Waiting extends StatelessWidget {
  const Waiting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Loading...',
            style: TextStyle(fontSize: 140, color: accent1),
          ),
          Text(
            'The stream is about to start!',
            style: TextStyle(fontSize: 40, color: accent2),
          ),
        ],
      ),
    );
  }
}

class Chat extends StatelessWidget {
  const Chat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

class Ending extends StatelessWidget {
  const Ending({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '👋',
            style: TextStyle(fontSize: 140, color: accent1),
          ),
          Text(
            'Thanks for watching!',
            style: TextStyle(fontSize: 40, color: accent2),
          ),
        ],
      ),
    );
  }
}
