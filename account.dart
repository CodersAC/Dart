import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicker/data.dart';
import 'package:quicker/location_info.dart';
import 'package:quicker/menu.dart';
import 'package:quicker/verification.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<UserDataProvider>(context, listen: false);
    final userData = userDataProvider.userData;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: const Color.fromARGB(255, 30, 60, 115),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 248, 249, 253),
            size: 20
          )
        ),
        title: const Text('Account',
          style: TextStyle(
            color: Color.fromARGB(255, 248, 249, 253),
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w700,
            fontSize: 25.0
          )
        )
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            color: const Color.fromARGB(255, 30, 60, 115),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage('images/profile.jpg'),
                ),
                const SizedBox(height: 16.0),
                Text(userData.name,
                  style: const TextStyle(
                    fontFamily: 'Figtree',
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(userData.email,
                  style: const TextStyle(
                    fontFamily: 'Figtree',
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8.0),
                MaterialButton(
                  minWidth: 200,
                  height: 50,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Verification()
                      )
                    );
                  },
                  color: const Color.fromARGB(255, 248, 249, 253),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: const Text('Verify your account',
                    style: TextStyle(
                      color: Color.fromARGB(255, 30, 60, 115),
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w600,
                        fontSize: 17.0
                    )
                  )
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.email,
                color: Color.fromARGB(255, 30, 60, 115), size: 30),
            title: const Text(
              'Verify your email address',
              style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Figtree',
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Email address verification success',
                      style: TextStyle(fontFamily: 'Figtree')
                    ),
                    content: Text('The verification link will be sent through email ${userData.email}.',
                      style: const TextStyle(fontFamily: 'Figtree')),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK',
                          style: TextStyle(
                            fontFamily: 'Figtree'
                          )
                        )
                      )
                    ]
                  )
              );
            }
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person,
              color: Color.fromARGB(255, 30, 60, 115),
              size: 30
            ),
            title: const Text('Personal Information',
              style: TextStyle(
                color: Color.fromARGB(255, 18, 18, 18),
                fontFamily: 'Figtree',
                fontSize: 18,
                fontWeight: FontWeight.w600),
            ),
            onTap: () {
              // Add your logic for editing personal information here
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.location_on,
              color: Color.fromARGB(255, 30, 60, 115),
              size: 30
            ),
            title: const Text('Location',
              style: TextStyle(
                color: Color.fromARGB(255, 18, 18, 18),
                fontFamily: 'Figtree',
                fontSize: 18,
                fontWeight: FontWeight.w600)
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LocationInfo())
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.security,
              color: Color.fromARGB(255, 30, 60, 115),
              size: 30
            ),
            title: const Text('Security',
              style: TextStyle(
                color: Color.fromARGB(255, 18, 18, 18),
                fontFamily: 'Figtree',
                fontSize: 18,
                fontWeight: FontWeight.w600)
            ),
            onTap: () {
              // Add your logic for managing security settings here
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.power_settings_new,
              color: Colors.red,
              size: 30
            ),
            title: const Text('Log out',
              style: TextStyle(
                color: Colors.red,
                fontFamily: 'Figtree',
                fontSize: 18,
                fontWeight: FontWeight.w600)
            ),
            onTap: () => showAlertDialog(context),
          ),
        ],
      ),
    );
  }
}