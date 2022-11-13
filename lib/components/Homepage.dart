import 'package:mlh_cropance/components/leaf_predictor.dart';

import './crop_recommeder.dart';
import 'package:flutter/material.dart';
import './crop_recommeder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(
              Icons.terrain_outlined,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Cropance',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height * 1.2,
        width: MediaQuery.of(context).size.width * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              focusColor: Colors.lightGreen,
              child: Card(
                elevation: 4,
                child: Container(
                  width: 300,
                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(children: [
                    Image.asset(
                      'assets/images/crop-rec.png',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Crop Recommender',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(
                    CropRecommender.routeName //TODO: Add the route name
                );
                
              },
            ),
            InkWell(
              focusColor: Colors.lightGreen,
              child: Card(
                elevation: 4,
                child: Container(
                  width: 300,
                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(children: [
                    Image.asset(
                      'assets/images/leaf.png',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Predict Leaf Disease',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(LeafPredictor.routeName);
              },
            )
          ],
        ),
      )),
    );
  }
}
