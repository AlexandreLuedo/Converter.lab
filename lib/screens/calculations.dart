import 'package:converter_lab/models/calculations_notifier.dart';
import 'package:converter_lab/widgets/frame_calculation.dart';
import 'package:converter_lab/widgets/mold_calculation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

class Calculations extends ConsumerWidget {
  const Calculations({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(moldProvider.notifier).moldResult;

    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [MoldCalculation(), SizedBox(height: 20), FrameCalculation()],
      ),
    );
  }
}
