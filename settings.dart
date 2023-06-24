import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: const Color.fromARGB(255, 248, 249, 253),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 18, 18, 18),
            size: 20
          )
        ),
        title: const Text('Settings',
          style: TextStyle(
            color: Color.fromARGB(255, 18, 18, 18),
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w700,
            fontSize: 25.0
          )
        )
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.notifications_on,
              color: Color.fromARGB(255, 30, 60, 115),
              size: 40
            ),
            title: const Text('Notifications',
              style: TextStyle(
                color: Color.fromARGB(255, 18, 18, 18),
                fontFamily: 'Figtree',
                fontSize: 20,
                fontWeight: FontWeight.w600
              )
            ),
            subtitle: Text('Select alerts and notifications that you want to be or not to be notified with.',
              style: TextStyle(
                color: Colors.grey[700],
                fontFamily: 'Figtree',
                fontSize: 15
              )
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.room_preferences,
              color: Color.fromARGB(255, 30, 60, 115),
              size: 40
            ),
            title: const Text('Preferences',
              style: TextStyle(
                color: Color.fromARGB(255, 18, 18, 18),
                fontFamily: 'Figtree',
                fontSize: 20,
                fontWeight: FontWeight.w600
              )
            ),
            subtitle: Text('Choose your preferences regaridng accessibility and display.',
              style: TextStyle(
                color: Colors.grey[700],
                fontFamily: 'Figtree',
                fontSize: 15
              )
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.report,
              color: Color.fromARGB(255, 30, 60, 115),
              size: 40
            ),
            title: const Text('Report Problem',
              style: TextStyle(
                color: Color.fromARGB(255, 18, 18, 18),
                fontFamily: 'Figtree',
                fontSize: 20,
                fontWeight: FontWeight.w600
              )
            ),
            subtitle: Text('Let us know if you have encountered a problem while using Quicker.',
              style: TextStyle(
                color: Colors.grey[700],
                fontFamily: 'Figtree',
                fontSize: 15
              )
            ),
            onTap: () {},
          ),
        ],
      )
    );
  }
}