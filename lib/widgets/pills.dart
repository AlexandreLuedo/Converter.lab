import 'package:converter_lab/data/pills_content.dart';
import 'package:flutter/material.dart';

class Pills extends StatelessWidget {
  const Pills({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var pillsContent in PillsContent.pill)
          Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  pillsContent['icon'] as IconData,
                  color: Colors.white,
                  size: 18,
                ),
                const SizedBox(width: 5),
                Text(
                  pillsContent['title'] ?? "",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
