import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

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
        title: const Text('Help',
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
            leading: const Icon(Icons.info,
              color: Color.fromARGB(255, 30, 60, 115),
              size: 40
            ),
            title: const Text('About us',
              style: TextStyle(
                color: Color.fromARGB(255, 18, 18, 18),
                fontFamily: 'Figtree',
                fontSize: 20,
                fontWeight: FontWeight.w600
              )
            ),
            subtitle: Text('Learn more about Quicker.',
              style: TextStyle(
                color: Colors.grey[700],
                fontFamily: 'Figtree',
                fontSize: 15
              )
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.new_label,
              color: Color.fromARGB(255, 30, 60, 115),
              size: 40
            ),
            title: const Text('What\'s new?',
              style: TextStyle(
                color: Color.fromARGB(255, 18, 18, 18),
                fontFamily: 'Figtree',
                fontSize: 20,
                fontWeight: FontWeight.w600
              )
            ),
            subtitle: Text('Check out the updates of Quicker.',
              style: TextStyle(
                color: Colors.grey[700],
                fontFamily: 'Figtree',
                fontSize: 15
              )
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.manage_accounts,
              color: Color.fromARGB(255, 30, 60, 115),
              size: 40
            ),
            title: const Text('Account and location management',
              style: TextStyle(
                color: Color.fromARGB(255, 18, 18, 18),
                fontFamily: 'Figtree',
                fontSize: 20,
                fontWeight: FontWeight.w600
              )
            ),
            subtitle: Text('See the guidelines on how to manage information about your account and location.',
              style: TextStyle(
                color: Colors.grey[700],
                fontFamily: 'Figtree',
                fontSize: 15
              )
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.safety_check,
              color: Color.fromARGB(255, 30, 60, 115),
              size: 40
            ),
            title: const Text('Safety and security',
              style: TextStyle(
                color: Color.fromARGB(255, 18, 18, 18),
                fontFamily: 'Figtree',
                fontSize: 20,
                fontWeight: FontWeight.w600
              )
            ),
            subtitle: Text('Check the ways on staying safe and secured, both physically and virtually.',
              style: TextStyle(
                color: Colors.grey[700],
                fontFamily: 'Figtree',
                fontSize: 15
              )
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.mail,
              color: Color.fromARGB(255, 30, 60, 115),
              size: 40
            ),
            title: const Text('Comments, complaints, and suggestions',
              style: TextStyle(
                color: Color.fromARGB(255, 18, 18, 18),
                fontFamily: 'Figtree',
                fontSize: 20,
                fontWeight: FontWeight.w600
              )
            ),
            subtitle: Text('Learn how to send us your comments, complaints, and suggestions.',
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