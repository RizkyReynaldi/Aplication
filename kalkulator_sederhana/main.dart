import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(Kalkulator());
}

class Kalkulator extends StatefulWidget {
  @override
  State<Kalkulator> createState() => _KalkulatorState();
}

class _KalkulatorState extends State<Kalkulator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController textFieldController_a = TextEditingController();
  final TextEditingController textFieldController_b = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  String a = "0";
  double tf_a = 0.0;

  String b = "0";
  double tf_b = 0.0;

  double hasil = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // START APP BAR
      appBar: AppBar(
        title: Text("Kalkulator Sederhana"),
        backgroundColor: Colors.amber,
      ),
      // END OF APP BAR
      // START BODY
      body: Form(
        key: _formkey,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // TEXT FIELD A
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: TextFormField(
                controller: textFieldController_a,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    value = "0";
                    a = value;
                    return 'Tolong Masukkan Angka Dengan Benar';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  a = value;
                },
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    labelText: "Bilangan A", border: OutlineInputBorder()),
              ),
            ),
            // END OF TEXT FIELD A

            // TEXT FIELD B
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: TextFormField(
                controller: textFieldController_b,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    value = "0";
                    b = value;
                    return 'Tolong Masukkan Angka Dengan benar';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  b = value;
                },
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    labelText: "Bilangan B", border: OutlineInputBorder()),
              ),
            ),
            // END OF TEXT FIELD B

            // TEXT FIELD HASIL
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Hasil : $hasil",
                    border: OutlineInputBorder(),
                    enabled: false),
              ),
            ),
            // END OF TEXT FIELD HASIL

            // BUTTON ACTION
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // BUTTON +
                  TextButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Data Berhasil Dihitung')));
                          tf_a = double.parse(a);
                          tf_b = double.parse(b);
                          setState(() {
                            hasil = tf_a + tf_b;
                          });
                        }
                      },
                      child: Icon(Icons.add)),
                  // END OF BUTTON +
                  // BUTTON -
                  TextButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Data Berhasil Dihitung')));
                          tf_a = double.parse(a);
                          tf_b = double.parse(b);
                          setState(() {
                            hasil = tf_a - tf_b;
                          });
                        }
                      },
                      child: Icon(Icons.minimize)),
                  // END OF BUTTON -
                  // BUTTON /
                  TextButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Data Berhasil Dihitung')));
                          tf_a = double.parse(a);
                          tf_b = double.parse(b);
                          setState(() {
                            hasil = tf_a / tf_b;
                          });
                        }
                      },
                      child: Text(
                        "/",
                        style: TextStyle(fontSize: 23),
                      )),
                  // END OF BUTTON /
                  // BUTTON X
                  TextButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Data Berhasil Dihitung')));
                          tf_a = double.parse(a);
                          tf_b = double.parse(b);
                          setState(() {
                            hasil = tf_a * tf_b;
                          });
                        }
                      },
                      child: Text(
                        "X",
                        style: TextStyle(fontSize: 23),
                      )),
                  // END OF BUTTON X
                ],
              ),
            )
            // END OF BUTTON ACTION
          ],
        )),
      ),
    );
  }
}
