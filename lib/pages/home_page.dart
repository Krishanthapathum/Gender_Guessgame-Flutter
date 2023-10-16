import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gende_guessgame/api/answer.dart';

import '../api/models/rest_client.dart';
final genderProvider= stateProvider();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Guess the Gender'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img.jpg',
                width: 200, height: 200, fit: BoxFit.cover),
            const SizedBox(height: 20),
            const Text(
              'Please enter your name',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your name',
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'You are a:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Male',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                final dio = Dio();
                final client = RestClient(dio);
                dio.interceptors.add(LogInterceptor(responseBody: true)); // open to see response
                client.getAnswer('John', 'US').then(answer){});
                ref.read(genderProvider),
              },
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(10),
                backgroundColor: MaterialStateProperty.all(Colors.purple),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
