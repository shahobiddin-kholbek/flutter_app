import 'package:flutter/material.dart';
import 'package:flutter_app/screens/third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
     body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text('This is the second screen.'),
      const Expanded(
        child: Image(
          image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRofv-8Ikym2gyTN2oMqNpfWtntf5rZzkkPkw&s'),
        ),
      ),
      const Expanded(
        child: Image(
          image: AssetImage('assets/naruto2.jpg'),
        ),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ThirdScreen()));
        },
        child: const Text('Go to Third Screen'),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Go back!'),
      ),
    ],
  ),
),

    );
  }
}
