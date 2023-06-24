import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicker/data.dart';
import 'package:quicker/log_in.dart';
import 'package:quicker/sign_up.dart';

void main() {
  runApp(const Quicker());
}

class Quicker extends StatelessWidget {
  const Quicker({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserDataProvider(),
      child: const MaterialApp(
        title: 'Quicker',
        debugShowCheckedModeBanner: false,
        home: Main()
      ),
    );
  }
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                    child: Text('Hello there!',
                      style: TextStyle(
                        color: Color.fromARGB(255, 18, 18, 18),
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0
                      )
                    )
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                    child: Text('Stay in touch for quick emergency response.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 18, 18, 18),
                        fontFamily: 'Figtree',
                        fontStyle: FontStyle.italic,
                        fontSize: 15.0
                      )
                    )
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/quicker_logo.png')
                      )
                    )
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 40),
                    child: Text('QUICKER',
                      style: TextStyle(
                        color: Color.fromARGB(255, 18, 18, 18),
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w900,
                        fontSize: 40.0
                      )
                    )
                  ),
                  MaterialButton(
                    minWidth: 200,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LogIn()));
                    },
                    color: const Color.fromARGB(255, 30, 60, 115),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: const Text('Log in',
                      style: TextStyle(
                        color: Color.fromARGB(255, 248, 249, 253),
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w600,
                        fontSize: 17.0
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  MaterialButton(
                    minWidth: 200,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUp()));
                    },
                    color: const Color.fromARGB(255, 30, 60, 115),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: const Text('Sign up',
                      style: TextStyle(
                        color: Color.fromARGB(255, 248, 249, 253),
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w600,
                        fontSize: 17.0
                      ),
                    ),
                  )
                ]
              )
            ]
          )
        )
      ),
      backgroundColor: const Color.fromARGB(255, 248, 249, 253),
    );
  }
}