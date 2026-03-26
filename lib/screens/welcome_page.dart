import 'package:converter_lab/models/calculations_notifier.dart';
import 'package:converter_lab/screens/calculations.dart';
import 'package:converter_lab/widgets/title.dart';
import 'package:converter_lab/widgets/pills.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomePage extends ConsumerStatefulWidget {
  const WelcomePage({super.key});

  @override
  ConsumerState<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends ConsumerState<WelcomePage> {
  int _resetKey = 0; // Not the best thing to do

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: const [Pills()]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MainTitle(),
            Calculations(key: ValueKey(_resetKey)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _resetKey++;
          });

          ref.read(moldProvider.notifier).reset();
          ref.read(frameProvider.notifier).reset();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).colorScheme.inverseSurface,
              content: Text(
                "Calculs réinitialisés",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
              ),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.all(16),
              duration: const Duration(seconds: 1),
              action: SnackBarAction(
                label: "OK",
                textColor: Theme.of(context).colorScheme.inversePrimary,
                onPressed: () {
                  // When click, works.
                },
              ),
            ),
          );
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
