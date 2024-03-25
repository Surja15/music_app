import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Made by Surja")),
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: () async {
              final player = AudioPlayer();
              player.play(AssetSource("lib/assets/audio/StarWars3.wav"));
            },
            child: Text('Click me'),
          ),
        ),
      ),
    );
  }
}
