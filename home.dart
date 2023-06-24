import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quicker/call.dart';
import 'package:quicker/emergency.dart';
import 'package:quicker/menu.dart';
import 'package:rxdart/rxdart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  final String title = "Title";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;
  StreamController<int>? _events;

  @override
  initState() {
    super.initState();
    _events = BehaviorSubject();
    _events?.add(10);
  }

  Timer? _timer;
  void _startTimer() {
    _counter = 10;
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      (_counter > 0) ? _counter-- : _timer?.cancel();
      _events?.add(_counter);
      if (_counter == 0) {
        Navigator.of(context, rootNavigator: true).pop();
        _timer!.cancel();
        showEmergency();
      }
    });
  }

  showEmergency() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Emergency())
    );
  }

  void alertD(BuildContext ctx) {
    var alert = AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        backgroundColor: Colors.grey[100],
        elevation: 0,
        content: StreamBuilder<int>(
            stream: _events?.stream,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return SizedBox(
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(snapshot.data.toString(),
                      style: const TextStyle(
                        color: Colors.red,
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w900,
                        fontSize: 60.0
                      )
                    ),
                    const Text('Confirm emergency?',
                      style: TextStyle(
                        color: Color.fromARGB(255, 18, 18, 18),
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w700,
                        fontSize: 30.0
                      )
                    ),
                    const Text('NOTE:\nConfirming emergency out of\nfrivolous intenions may result\nto serious consequences.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 18, 18, 18),
                        fontFamily: 'Figtree',
                        fontWeight: FontWeight.w700,
                        fontSize: 15.0
                      ),
                      textAlign: TextAlign.center
                    )
                  ],
                )
              );
            }
        ),
        actions: [
          TextButton(
            child: const Text('Cancel',
              style: TextStyle(
                color: Color.fromARGB(255, 30, 60, 115),
                fontFamily: 'Figtree',
                fontSize: 20.0,
                fontWeight: FontWeight.w600
              )
            ),
            onPressed: () {
              _timer!.cancel();
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
          TextButton(
            child: const Text('Confirm',
              style: TextStyle(
                color: Color.fromARGB(255, 30, 60, 115),
                fontFamily: 'Figtree',
                fontSize: 20.0,
                fontWeight: FontWeight.w600
              )
            ),
            onPressed: () {
              _timer!.cancel();
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Emergency())
              );
            },
          ),
        ],
    );
    showDialog(
        context: ctx,
        builder: (BuildContext c) {
          return alert;
        });
  }

  createSizedBox(String facility, BuildContext context) {
    return SizedBox(
      width: 175,
      height: 140,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              spreadRadius: 0,
              blurRadius: 8,
              offset: const Offset(0, 8)
            )
          ],
          color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(facility,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 18, 18, 18),
                fontFamily: 'Figtree',
                fontWeight: FontWeight.w700,
                fontSize: 22.0,
                height: 0.9
              )
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.small(
                  heroTag: null,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Call())
                    );
                  },
                  backgroundColor: const Color.fromARGB(255, 30, 60, 115),
                  child: const Icon(Icons.call)
                ),
                const SizedBox(width: 10),
                FloatingActionButton.small(
                  heroTag: null,
                  onPressed: () {
                    _startTimer();
                    alertD(context);
                  },
                  backgroundColor: const Color.fromARGB(255, 172, 0, 24),
                  child: const Icon(Icons.emergency_share)
                )
              ]
            )
          ],
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 249, 253),
      drawer: const Menu(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 249, 253),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 18, 18, 18),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/quicker_logo.png')
                )
              )
            ),
            const SizedBox(width: 10),
            const Text('QUICKER',
              style: TextStyle(
                color: Color.fromARGB(255, 18, 18, 18),
                fontFamily: 'Figtree',
                fontWeight: FontWeight.w900,
                fontSize: 20.0
              )
            )
          ],
        )
      ),
      body: Material(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                createSizedBox('Medical\nHospital', context),
                createSizedBox('Rehabilitation\nCenter', context),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                createSizedBox('Police\nStation', context),
                createSizedBox('Fire\nStation', context),
              ],
            ),
            createSizedBox('Barangay\nHall', context),
          ]
        )
      )
    );
  }
}

  


/*
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Timer? _timer;
  int _start = 30;

  @override
  void initState() {
    super.initState();
    _start = 30;
  }

  void startTimer() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
    else {
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) => setState(
          () {
            if (_start < 1) {
              timer.cancel();
            } else {
              _start = _start - 1;
            }
          },
        ),
      );
    }
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  Widget buildTime() {
    return Text('$_start',
      style: const TextStyle(
        color: Colors.red,
        fontFamily: 'Figtree',
        fontWeight: FontWeight.w900,
        fontSize: 30.0
      )
    );
  }

  createSizedBox(String facility, BuildContext context) {
    _HomeState home = _HomeState();
    return SizedBox(
      width: 175,
      height: 140,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              spreadRadius: 0,
              blurRadius: 8,
              offset: const Offset(0, 8)
            )
          ],
          color: Colors.white
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(facility,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 18, 18, 18),
                fontFamily: 'Figtree',
                fontWeight: FontWeight.w700,
                fontSize: 22.0,
                height: 0.9
              )
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.small(
                  heroTag: null,
                  onPressed: () {},
                  backgroundColor: const Color.fromARGB(255, 30, 60, 115),
                  child: const Icon(Icons.call)
                ),
                const SizedBox(width: 10),
                FloatingActionButton.small(
                  heroTag: null,
                  onPressed: () {
                    showEmergency(context);
                  },
                  backgroundColor: const Color.fromARGB(255, 172, 0, 24),
                  child: const Icon(Icons.emergency_share)
                )
              ]
            )
          ],
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 249, 253),
      drawer: Menu(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 249, 253),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 18, 18, 18),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/quicker_logo.png')
                )
              )
            ),
            const SizedBox(width: 10),
            const Text('QUICKER',
              style: TextStyle(
                color: Color.fromARGB(255, 18, 18, 18),
                fontFamily: 'Figtree',
                fontWeight: FontWeight.w900,
                fontSize: 20.0
              )
            )
          ],
        )
      ),
      body: Material(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                createSizedBox('Medical\nHospital', context),
                createSizedBox('Rehabilitation\nCenter', context),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                createSizedBox('Police\nStation', context),
                createSizedBox('Fire\nStation', context),
              ],
            ),
            createSizedBox('Barangay\nHall', context),
          ]
        )
      )
    );
  }
}

showEmergency(BuildContext context) {
  _HomeState home = _HomeState();
  Widget cancelButton = TextButton(
    child: const Text('Cancel',
      style: TextStyle(
        fontFamily: 'Figtree'
      )
    ),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );

  Widget confirmButton = TextButton(
    child: const Text('Confirm',
      style: TextStyle(
        fontFamily: 'Figtree'
      )
    ),
    onPressed: () {home.startTimer();},
  );

  AlertDialog emergency = AlertDialog(
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        home.buildTime(),
        const Text('Confirm emergency?',
          style: TextStyle(
            color: Color.fromARGB(255, 18, 18, 18),
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w700,
            fontSize: 20.0
          )
        ),
        const Text('NOTE\nConfirming emergency\nout of boredom may result\nto serious consequences.',
          style: TextStyle(
            color: Color.fromARGB(255, 18, 18, 18),
            fontFamily: 'Figtree',
            fontWeight: FontWeight.w700,
            fontSize: 15.0
          ),
          textAlign: TextAlign.center
        )
      ],
    ),
    actions: [
      cancelButton,
      confirmButton
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return emergency;
    }
  );
}
*/