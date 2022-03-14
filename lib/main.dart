import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// This widget is the root of your application.
  final etInput = TextEditingController();
  List<String> listSatuanSuhu = ["Kelvin", "Fahrenheit", "Reamur"];
  String selectedDrowpdown = "Kelvin";
  int hasilPerhitungan = 0;

  void onDropdownChanged(Object? value) {
    return setState(() {
      selectedDrowpdown = value.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Suhu',
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Konversi Suhu'),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              TextField(
                controller: etInput,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Celcius',
                  hintText: 'Enter the temperature in celcius',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              DropdownButton(
                isExpanded: true,
                value: selectedDrowpdown,
                items: listSatuanSuhu.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  onDropdownChanged(value);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Hasil",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "$hasilPerhitungan",
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (etInput.text.isNotEmpty) {
                                hasilPerhitungan = int.parse(etInput.text) * 1;
                                switch (selectedDrowpdown) {
                                  case "Kelvin":
                                    hasilPerhitungan =
                                        int.parse(etInput.text) * 2;
                                    break;
                                  case "Reamur":
                                    hasilPerhitungan =
                                        int.parse(etInput.text) * 4;
                                    break;
                                  case "Fahrenheit":
                                    hasilPerhitungan =
                                        int.parse(etInput.text) * 9;
                                    break;
                                  default:
                                }
                              }
                            });
                          },
                          child: const Text("Konversi Suhu"))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
