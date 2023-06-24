import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicker/data.dart';

class LocationInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final facilityProvider = Provider.of<FacilityProvider>(context);
    final selectedFacility = facilityProvider.selectedFacility;
    return Scaffold(
        appBar: AppBar(
            elevation: 5,
            backgroundColor: const Color.fromARGB(255, 30, 60, 115),
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios,
                    color: Color.fromARGB(255, 248, 249, 253), size: 20)),
            title: const Text('Location',
                style: TextStyle(
                    color: Color.fromARGB(255, 248, 249, 253),
                    fontFamily: 'Figtree',
                    fontWeight: FontWeight.w700,
                    fontSize: 25.0))),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                leading: Image.asset(
                  'images/location.png',
                  height: 80,
                  width: 50,
                  fit: BoxFit.fill,
                ),
                title: Text(
                  '${selectedFacility?.name}',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 18, 18, 18),
                      fontFamily: 'Figtree',
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const Divider(),
              ListTile(
                leading: Image.asset(
                  'images/hospital.png',
                  height: 80,
                  width: 50,
                  fit: BoxFit.fill,
                ),
                title: Text(
                  '${selectedFacility?.hospitalName}',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 18, 18, 18),
                      fontFamily: 'Figtree',
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const Divider(),
              ListTile(
                leading: Image.asset(
                  'images/rehab.png',
                  height: 80,
                  width: 50,
                  fit: BoxFit.fill,
                ),
                title: Text(
                  '${selectedFacility?.rehabName}',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 18, 18, 18),
                      fontFamily: 'Figtree',
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const Divider(),
              ListTile(
                leading: Image.asset(
                  'images/fire.png',
                  height: 80,
                  width: 50,
                  fit: BoxFit.fill,
                ),
                title: Text(
                  '${selectedFacility?.fireName}',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 18, 18, 18),
                      fontFamily: 'Figtree',
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const Divider(),
              ListTile(
                leading: Image.asset(
                  'images/police.png',
                  height: 80,
                  width: 50,
                  fit: BoxFit.fill,
                ),
                title: Text(
                  '${selectedFacility?.policeName}',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 18, 18, 18),
                      fontFamily: 'Figtree',
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const Divider(),
              ListTile(
                leading: Image.asset(
                  'images/munici.png',
                  height: 80,
                  width: 50,
                  fit: BoxFit.fill,
                ),
                title: Text(
                  '${selectedFacility?.brgyName}',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 18, 18, 18),
                      fontFamily: 'Figtree',
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        )
    );
  }
}
