import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicker/data.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();
  Color passwordColor = Colors.grey;
  Color nameColor = Colors.grey;
  Color emailColor = Colors.grey;

  void createAccount() {
    const snackBar = SnackBar(
      content: Text('Account created successfully!',
        style: TextStyle(
          fontFamily: 'Figtree'
        )
      ),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void validName() {
    setState(() {
      nameColor = Colors.grey;
    });
  }

  void validEmail() {
    setState(() {
      emailColor = Colors.grey;
    });
  }

  void invalidName() {
    setState(() {
      nameColor = Colors.red;
    });
  }

  void invalidEmail() {
    setState(() {
      emailColor = Colors.red;
    });
  }

  void invalidPassword() {
    setState(() {
      passwordColor = Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<UserDataProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 248, 249, 253),
      appBar: AppBar(
        elevation: 0,
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
        )
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 30),
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('Sign up',
                          style: TextStyle(
                            color: Color.fromARGB(255, 18, 18, 18),
                            fontFamily: 'Figtree',
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text('Create an account. Fill in with required information.',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontFamily: 'Figtree',
                            fontSize: 15,
                          )
                        ),
                        const SizedBox(height: 30)
                      ]
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                      child: Column(
                        children: [
                          TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: const TextStyle(
                                fontFamily: 'Figtree',
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: nameColor,
                                )
                              ),
                              border: const OutlineInputBorder()
                            )
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              labelStyle: const TextStyle(
                                fontFamily: 'Figtree',
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: emailColor,
                                )
                              ),
                              border: const OutlineInputBorder()
                            )
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            obscureText: true,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: const TextStyle(
                                fontFamily: 'Figtree',
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: passwordColor,
                                )
                              ),
                              border: const OutlineInputBorder()
                            )
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            obscureText: true,
                            controller: _confirmpasswordController,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              labelStyle: const TextStyle(
                                fontFamily: 'Figtree',
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: passwordColor,
                                )
                              ),
                              border: const OutlineInputBorder()
                            )
                          )
                        ]
                      )
                    ),
                    const SizedBox(height: 30),
                    MaterialButton(
                      minWidth: 200,
                      height: 60,
                      onPressed: () {
                        String name = _nameController.text;
                        String email = _emailController.text;
                        String password = _passwordController.text;
                        String confirmPassword = _confirmpasswordController.text;
                        if (password == confirmPassword &&
                            confirmPassword.isNotEmpty &&
                            name.isNotEmpty &&
                            email.isNotEmpty) {
                          UserData userData = UserData(
                            name: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                          userDataProvider.updateUserData(userData);
                          createAccount();
                          Navigator.pop(context);
                        }
                        else if (name.isEmpty) {
                          invalidName();
                          if (email.isNotEmpty) {
                            validEmail();
                          }
                        }
                        else if (email.isEmpty) {
                          invalidEmail();
                          if (name.isNotEmpty) {
                            validName();
                          }
                        }
                        else {
                          if (name.isNotEmpty && email.isNotEmpty) {
                            validName();
                            validEmail();
                          }
                          invalidPassword();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Check password.',
                                  style: TextStyle(
                                    fontFamily: 'Figtree'
                                  )
                                ),
                                content: const Text('Passwords are not the same or empty!',
                                  style: TextStyle(
                                    fontFamily: 'Figtree'
                                  )
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK',
                                      style: TextStyle(
                                        fontFamily: 'Figtree'
                                      )
                                    )
                                  )
                                ]
                              );
                            }
                          );
                        }
                      },
                      color: const Color.fromARGB(255, 30, 60, 115),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                      child: const Text('Sign up',
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
        )
      )
    );
  }
}