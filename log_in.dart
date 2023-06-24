import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicker/data.dart';
import 'package:quicker/location.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Color borderColor = Colors.grey;

  void notValid() {
    setState(() {
      borderColor = Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<UserDataProvider>(context, listen: false);
    final userData = userDataProvider.userData;
    Future<void> login() async {
      final email = emailController.text.trim();
      final password = passwordController.text;
      if (email == userData.email && password == userData.password && email.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Location())
        );
      }
      else {
        notValid();
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Login Failed',
              style: TextStyle(
                fontFamily: 'Figtree'
              )
            ),
            content: const Text('Invalid email address or password.',
              style: TextStyle(
                fontFamily: 'Figtree'
              )
            ),
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
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 248, 249, 253),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 248, 249, 253),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 18, 18, 18),
            size: 20
          )
        )
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 30),
            Column(
              children: [
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/quicker_logo.png')
                        )
                      ),
                    ),
                    const Text('Log in',
                      style: TextStyle(
                        color: Color.fromARGB(255, 18, 18, 18),
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text('Welcome back! Log in with your credentials.',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontFamily: 'Figtree',
                        fontSize: 15,
                      )
                    ),
                    const SizedBox(height: 30),
                  ]
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                  child: Column(
                    children: [
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: const TextStyle(
                            fontFamily: 'Figtree',
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: borderColor,
                            )
                          ),
                          border: const OutlineInputBorder()
                        )
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            fontFamily: 'Figtree',
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: borderColor,
                            ),
                          ),
                          border: const OutlineInputBorder()),
                      )
                    ],
                  )
                ),
                const SizedBox(height: 25),
                MaterialButton(
                  minWidth: 200,
                  height: 60,
                  onPressed: () async {
                    await login();
                  },
                  color: const Color.fromARGB(255, 30, 60, 115),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                  child: const Text('Log in',
                    style: TextStyle(
                      color: Color.fromARGB(255, 248, 249, 253),
                      fontFamily: 'Figtree',
                      fontWeight: FontWeight.w600,
                      fontSize: 17.0
                    )
                  )
                )
              ]
            )
          ]
        )
      )
    );
  }
}