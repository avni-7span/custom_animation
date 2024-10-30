import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink.withOpacity(0.6),
        title: const Text('Detail Screen'),
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) => Container(
          height: 80,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          color: Colors.blueAccent.shade100.withOpacity(0.4),
          child: const Text(
            'Meow',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
