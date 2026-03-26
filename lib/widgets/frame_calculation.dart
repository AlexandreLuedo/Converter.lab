import 'package:converter_lab/data/fields.dart';
import 'package:converter_lab/models/custom_cards.dart';
import 'package:converter_lab/models/calculations_notifier.dart';
import 'package:converter_lab/widgets/copy_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

class FrameCalculation extends ConsumerWidget {
  const FrameCalculation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final frameState = ref.watch(frameProvider);
    final result = ref.read(frameProvider.notifier).frameResult;
    final length = ref.watch(frameProvider).length;
    final width = ref.watch(frameProvider).width;
    final height = ref.watch(frameProvider).height;
    final number = ref.watch(frameProvider).number;

    return CustomCards(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: [
            Text(
              'Calcul de cadre',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),

            for (var field in Fields.frame)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                  ],
                  decoration: InputDecoration(
                    prefixIcon: Icon(field['icon'], fill: 1),
                    border: const OutlineInputBorder(),
                    labelText: field['label'],
                    hintText: field['hint'],
                  ),
                  onChanged: (value) {
                    final cleanValue = value.replaceAll(',', '.');
                    final number = double.tryParse(cleanValue);

                    ref
                        .read(frameProvider.notifier)
                        .updateValue(field['id'], number);
                  },
                ),
              ),

            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Symbols.all_inclusive, fill: 1),
                SizedBox(width: 10),
                Text('Poids total'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectableText(
                  "${result.toStringAsFixed(3)} g",
                  style: const TextStyle(fontSize: 45),
                ),
                CopyShare(
                  result: result,
                  length: length,
                  width: width,
                  height: height,
                  frameNumber: number,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
