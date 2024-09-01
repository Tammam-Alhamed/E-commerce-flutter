import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              // Update the state of the app

              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Business'),
            onTap: () {
              // Update the state of the app

              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('School'),
            onTap: () {
              // Update the state of the app

              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}