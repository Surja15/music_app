import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_by_surja/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("S E T T I N G S"),
      ),
      body:Container(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          //dark mode
          const Text("Dark Mode "),

          //Switch
          CupertinoSwitch(
            value: Provider.of<ThemeProvider>(context, listen:false).isDarkMode, 
            onChanged: (value) => Provider.of<ThemeProvider>(context, listen:false).toggleTheme(),)
        ],)
      )
    );
  }
}