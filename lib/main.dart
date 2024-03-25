import 'package:flutter/material.dart';
import 'package:music_by_surja/models/playlist_provider.dart';
import 'package:music_by_surja/themes/light_mode.dart';
import 'package:music_by_surja/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';

void main(){
  runApp(
    MultiProvider(providers: [ChangeNotifierProvider(create: (context)=> ThemeProvider(),
    ),
    ChangeNotifierProvider(create: (context)=> PlaylistProvider()),
    ],
    child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}


//For this project, i will list all the bugs i encountered and fixed during development. 