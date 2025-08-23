import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget{
    const  SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "NewsApp",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}