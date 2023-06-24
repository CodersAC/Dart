import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicker/home.dart';
import 'package:quicker/data.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String? _selectedValue;
  final List<SelectFacility> _selectFacility = [
    SelectFacility(
      name: 'Angeles City',
      hospitalName: 'Angeles University Foundation Medical Center',
      rehabName: 'Philippine Rehabilitation Center Medical Clinic',
      policeName: 'Angeles City PNP Police Station 4',
      fireName: 'Angeles City Fire Station',
      brgyName: 'Balibago Barangay Hall',
    ),
    SelectFacility(
        name: 'Apalit',
        hospitalName: 'Apalit Doctor\'s Hospital',
        rehabName: 'Regional Rehabilitation Center for Youth',
        policeName: 'Apalit Municipal Police Station',
        fireName: 'BFP R3 Apalit Fire Station',
        brgyName: 'Sampaloc Brgy Hall'),
    SelectFacility(
        name: 'Arayat',
        hospitalName: 'Arayat Doctors Hospital',
        rehabName: 'AUF-CBRP Physical Therapy',
        policeName: 'Arayat MPS, Pampanga PPO',
        fireName: 'BFP R3 Arayat Fire Station',
        brgyName: 'Barangay Hall San Antonio'),
    SelectFacility(
        name: 'Magalang',
        hospitalName: 'Dr. Andres Luciano District Hospital',
        rehabName: 'Regional Rehabilitation Center for Youth',
        policeName: 'Magalang Municipal Police Station',
        fireName: 'BFP R3 Magalang Fire Station',
        brgyName: 'Santo Rosario Barangay Hall'),
    SelectFacility(
        name: 'Mabalacat City',
        hospitalName: 'Dr. Amado L. Garcia Medical Center',
        rehabName: 'Good Rehabilitation Center',
        policeName: 'Mabalacat City Police Station',
        fireName: 'BFP R3 Mabalacat City Fire Station',
        brgyName: 'Dau Barangay Hall'),
    SelectFacility(
        name: 'Macabebe',
        hospitalName: 'Our Lady of Rosary Hospital, Inc.',
        rehabName: 'Masantol Materials Recovery Facility',
        policeName: 'Macabebe MPS, Pampanga PPO',
        fireName: 'BFP R3 Macabebe Fire Station',
        brgyName: 'San Isidro Barangay Hall'),
  ];

  List<SelectFacility> _filteredSelectFacility() {
    if (_selectedValue == null) {
      return [];
    }
    return _selectFacility
        .where((selectFacility) => selectFacility.name == _selectedValue)
        .toList();
  }

  void _onDropdownChanged(String? newValue) {
    setState(() {
      _selectedValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => FacilityProvider(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
                appBar: AppBar(
                  backgroundColor: const Color.fromARGB(255, 30, 60, 115),
                  title: const Text(
                    'Facilities Near You',
                    style: TextStyle(
                      color: Color.fromARGB(255, 248, 249, 253),
                      fontFamily: 'Figtree',
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                body: Center(
                    child: SingleChildScrollView(
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: Column(
                              children: [
                                Image.asset(
                                  'images/location.png',
                                  height: 100,
                                  fit: BoxFit.fill,
                                ),
                                const Text(
                                  'Please Select Your Location',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 18, 18, 18),
                                    fontFamily: 'Figtree',
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                DropdownButton<String>(
                                  value: _selectedValue,
                                  items: _selectFacility.map((selectFacility) {
                                    return DropdownMenuItem<String>(
                                      value: selectFacility.name,
                                      child: Text(selectFacility.name,
                                          style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 18, 18, 18),
                                            fontFamily: 'Figtree',
                                          )),
                                    );
                                  }).toList(),
                                  onChanged: _onDropdownChanged,
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: _filteredSelectFacility().length,
                                    itemBuilder: (context, index) {
                                      final selectFacility =
                                          _filteredSelectFacility()[index];
                                      return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '\nAvailable Facilities Near ${selectFacility.name}\n\n',
                                              style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 18, 18, 18),
                                                  fontFamily: 'Figtree',
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    'images/hospital.png',
                                                    height: 80,
                                                    width: 50,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  SizedBox(
                                                      width: 350,
                                                      height: 50,
                                                      child: InputDecorator(
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'HOSPITAL',
                                                          labelStyle:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ),
                                                        child: Text(
                                                            selectFacility
                                                                .hospitalName),
                                                      ))
                                                ]),
                                            Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    'images/rehab.png',
                                                    height: 80,
                                                    width: 50,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  SizedBox(
                                                      width: 350,
                                                      height: 50,
                                                      child: InputDecorator(
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'REHABILITATION CENTER',
                                                          labelStyle:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ),
                                                        child: Text(
                                                            selectFacility
                                                                .hospitalName),
                                                      ))
                                                ]),
                                            Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    'images/police.png',
                                                    height: 80,
                                                    width: 50,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  SizedBox(
                                                      width: 350,
                                                      height: 50,
                                                      child: InputDecorator(
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'POLICE STATION',
                                                          labelStyle:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ),
                                                        child: Text(
                                                            selectFacility
                                                                .hospitalName),
                                                      ))
                                                ]),
                                            Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    'images/fire.png',
                                                    height: 80,
                                                    width: 50,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  SizedBox(
                                                      width: 350,
                                                      height: 50,
                                                      child: InputDecorator(
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'FIRE STATION',
                                                          labelStyle:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ),
                                                        child: Text(
                                                            selectFacility
                                                                .hospitalName),
                                                      ))
                                                ]),
                                            Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    'images/munici.png',
                                                    height: 80,
                                                    width: 50,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  SizedBox(
                                                      width: 350,
                                                      height: 50,
                                                      child: InputDecorator(
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'BARANGAY HALL',
                                                          labelStyle:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ),
                                                        child: Text(
                                                            selectFacility
                                                                .hospitalName),
                                                      ))
                                                ]),
                                            MaterialButton(
                                              minWidth: 200,
                                              height: 60,
                                              onPressed: () {
                                                final facilityProvider =
                                                    Provider.of<
                                                            FacilityProvider>(
                                                        context,
                                                        listen: false);
                                                facilityProvider
                                                    .setSelectedFacility(
                                                        selectFacility);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const Home()));
                                              },
                                              color: Colors.redAccent,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          60)),
                                              child: Text(
                                                  'Use ${selectFacility.name} as location',
                                                  style: const TextStyle(
                                                      fontFamily: 'Figtree',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16,
                                                      color: Colors.white70)),
                                            )
                                          ]);
                                    },
                                  ),
                                ),
                              ],
                            )))))));
  }
}
