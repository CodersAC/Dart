import 'package:flutter/material.dart';
import 'package:quicker/account.dart';
import 'package:quicker/main.dart';
import 'package:quicker/help.dart';
import 'package:quicker/settings.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(height: 20),
          ListTile(
            leading: Image.asset('images/quicker_logo.png'),
            title: const Text('QUICKER',
              style: TextStyle(
                fontFamily: 'Figtree',
                fontWeight: FontWeight.w900,
                fontSize: 30.0
              )
            )
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.person,
              color: Color.fromARGB(255, 18, 18, 18)
            ),
            title: const Text('Account',
              style: TextStyle(
                color: Color.fromARGB(255, 18, 18, 18),
                fontFamily: 'Figtree',
                fontWeight: FontWeight.w600,
                fontSize: 17.0
              )),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Account())
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings,
              color: Color.fromARGB(255, 18, 18, 18)
            ),
            title: const Text('Settings',
              style: TextStyle(
                color: Color.fromARGB(255, 18, 18, 18),
                fontFamily: 'Figtree',
                fontWeight: FontWeight.w600,
                fontSize: 17.0
              )),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Settings())
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.question_mark,
              color: Color.fromARGB(255, 18, 18, 18)
            ),
            title: const Text('Help',
              style: TextStyle(
                color: Color.fromARGB(255, 18, 18, 18),
                fontFamily: 'Figtree',
                fontWeight: FontWeight.w600,
                fontSize: 17.0
              )),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Help())
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app,
              color: Colors.red
            ),
            title: const Text('Log Out',
              style: TextStyle(
                color: Colors.red,
                fontFamily: 'Figtree',
                fontWeight: FontWeight.w600,
                fontSize: 17.0
              )
            ),
            onTap: () => showAlertDialog(context),
          )
        ]
      )
    );
  }
}

showAlertDialog(BuildContext context) {
  Widget noButton = TextButton(
    child: const Text('No',
      style: TextStyle(
        fontFamily: 'Figtree'
      )
    ),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );
  Widget yesButton = TextButton(
    child: const Text('Yes',
      style: TextStyle(
        fontFamily: 'Figtree'
      )
    ),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Quicker()));
    },
  );

  AlertDialog logOutDialog = AlertDialog(
    title: const Text('Log Out',
      style: TextStyle(
        fontFamily: 'Figtree'
      )
    ),
    content: const Text('Do you want to log out?',
      style: TextStyle(
        fontFamily: 'Figtree'
      )
    ),
    actions: [
      noButton,
      yesButton
    ]
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return logOutDialog;
    }
  );
}