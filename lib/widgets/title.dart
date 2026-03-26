import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 100, bottom: 100),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Bienvenue dans \n',
            style: TextStyle(fontSize: 20, color: Colors.grey),
            children: <TextSpan>[
              const TextSpan(
                text: 'Converter',
                style: TextStyle(
                  color: Color(0xFF232023),
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              TextSpan(
                text: '.lab',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
