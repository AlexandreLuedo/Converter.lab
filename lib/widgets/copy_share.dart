import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:share_plus/share_plus.dart';

class CopyShare extends StatelessWidget {
  final double result;
  final String unit;
  final double? weight;
  final double? mussles;
  final double? moldNumber;
  final double? length;
  final double? width;
  final double? height;
  final double? frameNumber;

  const CopyShare({
    super.key,
    required this.result,
    this.unit = "g",
    this.weight,
    this.mussles,
    this.moldNumber,
    this.length,
    this.width,
    this.height,
    this.frameNumber,
  });

  @override
  Widget build(BuildContext context) {
    void copyToClipboard(BuildContext context, String text) {
      Clipboard.setData(ClipboardData(text: text)).then((_) {
        if (!context.mounted) return; // For safety
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Copié dans le presse-papier !"),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 1),
          ),
        );
      });
    }

    void shareResultAction(BuildContext context, String text) {
      SharePlus.instance.share(ShareParams(text: text)).then((shareResult) {
        if (!context.mounted) return; // Also for safety
        if (shareResult.status == ShareResultStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text(
                "Merci d'avoir partagé votre calcul avec Converter.lab !",
              ),
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 2),
            ),
          );
        }
      });
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.copy_rounded),
          onPressed: () {
            copyToClipboard(context, "${result.toStringAsFixed(3)} $unit");
          },
          tooltip: "Copier le résultat",
        ),
        const SizedBox(width: 20),
        IconButton(
          icon: const Icon(Symbols.share, fill: 1),
          onPressed: () {
            shareResultAction(
              context,
              weight == null
                  ? "Informations du calcul:\nLongueur du cadre: $length\nLargeur du cadre: $width\nHauteur du cadre: $height\nPoids Total:${result.toStringAsFixed(3)} $unit\nMerci d'avoir utilisé Converter.lab"
                  : "Informations du calcul:\nPoids par empreinte: $weight\nNombre d\'empreintes: $mussles\nNombre de moules: $moldNumber\nPoids Total: ${result.toStringAsFixed(3)} $unit\nMerci d'avoir utilisé Converter.lab",
            );
          },
          tooltip: 'Partager le résultat',
        ),
      ],
    );
  }
}
