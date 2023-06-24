import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicker/data.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  String? selectedId;

  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<UserDataProvider>(context, listen: false);
    final userData = userDataProvider.userData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification',
          style: TextStyle(
            color: Color.fromARGB(255, 248, 249, 253),
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w700,
            fontSize: 25.0
          )
        ),
        backgroundColor: const Color.fromARGB(255, 30, 60, 115),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Account Verification',
              style: TextStyle(
                color: Color.fromARGB(255, 18, 18, 18),
                fontFamily: 'Figtree',
                fontSize: 23,
                fontWeight: FontWeight.bold),
            ),
            Text('Enter valid ID information.',
              style: TextStyle(
                color: Colors.grey[700],
                fontFamily: 'Figtree',
                fontSize: 15,
              )
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Full Name',
                labelStyle: TextStyle(
                  fontFamily: 'Figtree'
                )
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                SizedBox(
                  height: 66,
                  child: DropdownButton<String>(
                    hint: const Text('ID Type',
                      style: TextStyle(
                        fontFamily: 'Figtree'
                      )
                    ),
                    value: selectedId,
                    items: <String>['UMID', 'Office ID', 'Driver\'s License',
                                    'PRC ID', 'Passport', 'Senior Citizen ID',
                                    'SSS ID', 'Voter\'s ID', 'PhilID'
                                    'Postal ID', 'School ID', 'Others'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                          style: const TextStyle(
                            fontFamily: 'Figtree'
                          )
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) => setState(() {
                      selectedId = value;
                    })
                  )
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'ID Number',
                      labelStyle: TextStyle(
                        fontFamily: 'Figtree'
                      )
                    ),
                  )
                )
              ],
            ),
            const SizedBox(height: 10),
            const Text('Upload ID Photo and Selfie',
              style: TextStyle(
                fontFamily: 'Figtree',
                fontSize: 16),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 250,
                    height: 150,
                    color: Colors.grey,
                    child: const Center(
                      child: Icon(
                        Icons.camera_alt,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 150,
                    height: 150,
                    color: Colors.grey,
                    child: const Center(
                      child: Icon(
                        Icons.camera_alt,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ]
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 30, 60, 115),
                minimumSize: const Size(100, 50),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Initial verification success',
                      style: TextStyle(
                        fontFamily: 'Figtree'
                      )
                    ),
                    content: Text('The link will be sent through email ${userData.email} for complete verification.',
                      style: const TextStyle(
                        fontFamily: 'Figtree'
                      )
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK',
                          style: TextStyle(fontFamily: 'Figtree')
                        )
                      )
                    ]
                  )
                );
              },
              child: const Text('Submit',
                style: TextStyle(
                  fontFamily: 'Figtree'
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}