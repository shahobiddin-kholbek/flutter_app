import 'package:flutter/material.dart';
import 'package:flutter_app/screens/second_screen.dart';
import 'package:flutter_app/screens/third_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('First Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondScreen()));
                }, 
                child: const Text('Go to Second Screen'),
                ),
                ElevatedButton(
                  onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ThirdScreen()));
              },  
                  child: const Text('Go to Third Screen'),
                  ),
                ],
          ),
        ));
  }
}
