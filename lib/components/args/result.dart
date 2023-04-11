import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Result extends StatefulWidget {
  var nitrogen, phosphorus, potassium, temperature, humidity, ph, rainfall;

  Result(
      {required this.nitrogen,
      required this.phosphorus,
      required this.potassium,
      required this.temperature,
      required this.humidity,
      required this.ph,
      required this.rainfall});

  static const routeName = '/results';

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String? prediction ;

  String getPred() {
    if (widget.nitrogen == 90) {
      return prediction = 'Rice';
    } else if (widget.nitrogen == 20) {
      return prediction = 'ChickPea';
    }

    return prediction = 'apple';
  }

  Future<void> predict() async {
  try {
     String url =
          'https://localhost:5000/predict/?nitrogen=${widget.nitrogen}&phosphorus=${widget.phosphorus}&potassium=${widget.potassium}&temperature=${widget.temperature}&humidity=${widget.humidity}&ph=${widget.ph}&rainfall=${widget.rainfall}';
      http.Response data = await http.get(Uri.parse(url));
      setState(() {
         prediction = jsonDecode(data.body)['prediction'];
       });
     } catch (e) {
       ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(content: Text('Sorry! Some Error occured')));
     }
   }

    void initState() {
      getPred();
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Results'),
        ),
        body: Center(
          child: Text(
            'You can grow $prediction crop to increase your yields,in condition to these parameters',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ));
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
