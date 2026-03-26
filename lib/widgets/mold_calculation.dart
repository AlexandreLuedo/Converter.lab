import 'package:converter_lab/data/fields.dart';
import 'package:converter_lab/models/custom_cards.dart';
import 'package:converter_lab/models/calculations_notifier.dart';
import 'package:converter_lab/widgets/copy_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

class MoldCalculation extends ConsumerWidget {
  const MoldCalculation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moldState = ref.watch(moldProvider);
    final result = ref.read(moldProvider.notifier).moldResult;
    final currentWeight = ref.watch(moldProvider).weight;
    final currentMussles = ref.watch(moldProvider).numberMussels;
    final currentNumber = ref.watch(moldProvider).number;

    return CustomCards(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Calcul du moule',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            for (var field in Fields.mold)
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
                        .read(moldProvider.notifier)
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
                  weight: currentWeight,
                  mussles: currentMussles,
                  moldNumber: currentNumber,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
