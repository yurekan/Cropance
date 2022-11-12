import './Homepage.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
          ()=>Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder:
                                                          (context) => 
                                                          HomePage()
                                                         )
                                       )
         );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      color: Colors.white,
      child:Container(
        color: Colors.green,
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        child: const Center(
          child: Icon(
            Icons.terrain_outlined,
            color: Colors.white,
            size: 100,
          ),
        ),
      )
    );
  }
}
