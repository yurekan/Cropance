import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'dart:math';
import './args/result.dart';

class CropRecommender extends StatefulWidget {
  static const routeName = '/crop-recommender';

  @override
  State<CropRecommender> createState() => _CropRecommenderState();
}

class _CropRecommenderState extends State<CropRecommender> {
  TextEditingController nitrogen = TextEditingController();
  TextEditingController phosphorus = TextEditingController();
  TextEditingController potassium = TextEditingController();
  TextEditingController temperature = TextEditingController();
  TextEditingController humidity = TextEditingController();
  TextEditingController ph = TextEditingController();
  TextEditingController rainfall = TextEditingController();

  // Uint8List? list;

  // loadModel() async {
  //   await Tflite.loadModel(
  //     model: "assets/model2/crop_model.tflite",
  //     labels: "assets/model2/labels.txt",
  //   );
  // }

  // void initState() {
  //   loadModel();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crop Recommender',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Enter the details given below',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                controller: nitrogen,
                decoration: const InputDecoration(
                  labelText: 'Ratio of Nitrogen Content',
                  hintText: 'Enter the ratio of nitrogen content',
                ),
                validator: (val) {
                  if (val!.isEmpty || val == null) {
                    return 'Please enter the ratio of nitrogen content';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                controller: phosphorus,
                decoration: const InputDecoration(
                  labelText: 'Ratio of Phosphorous Content',
                  hintText: 'Enter the ratio of Phosphorous content',
                ),
                validator: (val) {
                  if (val!.isEmpty || val == null) {
                    return 'Please enter the ratio of Phosporous content';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: potassium,
                decoration: const InputDecoration(
                  labelText: 'Ratio of Pottassium Content',
                  hintText: 'Enter the ratio of Pottassium content',
                ),
                validator: (val) {
                  if (val!.isEmpty || val == null) {
                    return 'Please enter the ratio of Pottassium content';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                controller: temperature,
                decoration: const InputDecoration(
                  labelText: 'Temperature(in degree C)',
                  hintText: 'Enter the temperature in degree',
                ),
                validator: (val) {
                  if (val!.isEmpty || val == null) {
                    return 'Please enter the temperature value';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                controller: humidity,
                decoration: const InputDecoration(
                  labelText: 'Humidity(in percentage)',
                  hintText: 'Enter the humidity value',
                ),
                validator: (val) {
                  if (val!.isEmpty || val == null) {
                    return 'Please enter the humidity percent';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                controller: ph,
                decoration: const InputDecoration(
                  labelText: 'pH value',
                  hintText: 'Enter the pH value',
                ),
                validator: (val) {
                  if (val!.isEmpty || val == null) {
                    return 'Please enter the pH value';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: rainfall,
                decoration: const InputDecoration(
                  labelText: 'Rainfall(in mm)',
                  hintText: 'Enter the rainfall value',
                ),
                validator: (val) {
                  if (val!.isEmpty || val == null) {
                    return 'Please enter the rainfall value';
                  }
                  return null;
                },
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              height: 60,
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Result(
                                            
                                              nitrogen: nitrogen.text ,
                                              phosphorus:phosphorus.text,
                                              potassium:potassium.text,
                                              temperature:temperature.text,
                                              ph:ph.text,
                                              humidity:humidity.text,
                                              rainfall:rainfall.text
                                          )));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
