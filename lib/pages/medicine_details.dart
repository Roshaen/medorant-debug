import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medorant/widgets/counterfeit.dart';
import 'dart:convert';
import 'package:medorant/widgets/drawer.dart';

class MedicineDetails extends StatefulWidget {
  MedicineDetails({Key? key}) : super(key: key);

  @override
  State<MedicineDetails> createState() => _MedicineDetailsState();
}

class _MedicineDetailsState extends State<MedicineDetails> {
  var medName = '';
  var mrp = '';
  var store = [];
  var use = '';
  var howToUse = '';
  var sideEffects = [];
  var counterfeit = true;
  var problem = {};
  var altMed = [];

  getDetails(String id, String name) async {
    var finalName = name.trim();
    var data = await http.get(
      Uri.parse(
          'https://8g34ra4qq2.execute-api.ap-south-1.amazonaws.com/dev/med/$finalName?user_id=$id'),
    );

    var finalData = jsonDecode(data.body);
    medName = finalData['medicine_name'];
    mrp = finalData['mrp'] as String;
    store = finalData['best_buy'];
    use = finalData['uses'][0];
    howToUse = finalData['how_to_use'];
    sideEffects = finalData['side_effects'];
    counterfeit = finalData['counterFeit'];
    problem = finalData['severity'];

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as List;
    getDetails(data[1], data[0]);

    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      drawer: const AppDrawer(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Center(
                child: SizedBox(
                    height: 200, child: Image.asset('assets/images/med.png')),
              ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle,
                      color: counterfeit ? Colors.green : Colors.red),
                  Text(
                    counterfeit
                        ? 'It\'s safe for you!'
                        : 'It\'s not safe for you!',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Counter(),
              Column(children: [
                counterfeit
                    ? Container()
                    : Counter(
                        problem['highSeverity']['count'].toString(),
                        problem['highSeverity']['count'].toString(),
                        problem['lowSeverity']['count'].toString(),
                      ),
              ]),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Medicine Name',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 112, 111, 229)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    medName,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Price',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 112, 111, 229)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    mrp,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Use',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 112, 111, 229)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    use,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'How to use',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 112, 111, 229)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    howToUse,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Side Effects',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 112, 111, 229)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: sideEffects
                        .map((e) => Text(
                              e,
                              textAlign: TextAlign.start,
                              style: const TextStyle(fontSize: 18),
                            ))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Stores',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 112, 111, 229)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: store
                        .map(
                          (e) => InkWell(
                            child: Text(
                              '${e['store']}',
                              textAlign: TextAlign.start,
                              style: const TextStyle(fontSize: 18),
                            ),
                            onTap: () {},
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(
                    height: 60,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
