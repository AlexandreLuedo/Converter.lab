import 'package:material_symbols_icons/symbols.dart';

// I try this new way to store datas
class Fields {
  static List<Map<String, dynamic>> usages = [
    {'title': 'Calcul du moule', 'data': mold},
    {'title': 'Calcul de cadre', 'data': frame},
  ];

  static List<Map<String, dynamic>> mold = [
    {
      'id': 'weight',
      'label': 'Poids par empreinte',
      'hint': 'Ex: 8g',
      'icon': Symbols.scale,
    },
    {
      'id': 'numberMussles',
      'label': 'Nombre d\'empreintes',
      'hint': 'Ex: 24',
      'icon': Symbols.view_module,
    },
    {
      'id': 'number',
      'label': 'Nombre de moules',
      'hint': 'Optionnel',
      'icon': Symbols.numbers,
    },
  ];

  static List<Map<String, dynamic>> frame = [
    {
      'id': 'length',
      'label': 'Longueur',
      'hint': 'Ex: 12 cm',
      'icon': Symbols.arrow_range,
    },
    {
      'id': 'width',
      'label': 'Largeur',
      'hint': 'Ex: 12 cm',
      'icon': Symbols.open_in_full,
    },
    {
      'id': 'height',
      'label': 'Hauteur',
      'hint': 'Ex: 0.6 cm',
      'icon': Symbols.height,
    },
    {
      'id': 'number',
      'label': 'Nombre de cadres',
      'hint': 'Optionnel',
      'icon': Symbols.numbers,
    },
  ];
}
