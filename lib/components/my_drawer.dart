import 'package:flutter/material.dart';
import 'package:music_by_surja/pages/about.dart';

import '../pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(backgroundColor: Theme.of(context).colorScheme.background,
    child:Column(
      children: [
        //logo
        DrawerHeader(child: Center(
          child: Icon(Icons.auto_awesome, size: 60, color: Theme.of(context).colorScheme.inversePrimary,),
          
        ),),

        //home tile
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            title: Text(" H O M E"),titleTextStyle:TextStyle(color: Theme.of(context).colorScheme.inversePrimary,),
            leading: Icon(Icons.home, color: Theme.of(context).colorScheme.inversePrimary,),
            onTap: () => Navigator.pop(context),
          ),
        ),

        //settings tile
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            title: Text(" S E T T I N G S"), titleTextStyle:TextStyle(color: Theme.of(context).colorScheme.inversePrimary,),
            leading: Icon(Icons.settings, color: Theme.of(context).colorScheme.inversePrimary,), //Bug #7 icons color needed to be manually inverted. fixed
            onTap: () {
              //pop drawer
              Navigator.pop(context);
              //navigate to settings page as well
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsPage(),),);
              
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            title: Text(" A B O U T"),titleTextStyle:TextStyle(color: Theme.of(context).colorScheme.inversePrimary,),
            leading: Icon(Icons.attribution_outlined, color: Theme.of(context).colorScheme.inversePrimary,),
            onTap: () {
              //pop drawer
              Navigator.pop(context);
              //navigate to settings page as well
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AboutPage(),),);
              
            },
          ),
        ),
      ],
    ));
  }
}