import 'package:flutter/material.dart';

class Emergency extends StatelessWidget {
  const Emergency({super.key});

  @override
  Widget build(BuildContext context) {
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
            Container(
              height: MediaQuery.of(context).size.height / 4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/siren.gif')
                )
              ),
            ),
            const Text('Emergency responded!',
              style: TextStyle(
                color: Color.fromARGB(255, 18, 18, 18),
                fontFamily: 'Figtree',
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            )
          ]
        )
      )
    );
  }
}