import 'package:flutter_riverpod/flutter_riverpod.dart';

// Moulage
class MoldState {
  final double weight;
  final double numberMussels;
  final double number;

  MoldState({this.weight = 0.0, this.numberMussels = 0.0, this.number = 1.0});

  MoldState copyWith({double? weight, double? numberMussels, double? number}) {
    return MoldState(
      weight: weight ?? this.weight,
      numberMussels: numberMussels ?? this.numberMussels,
      number: number ?? this.number,
    );
  }
}

class MoldNotifier extends Notifier<MoldState> {
  @override
  MoldState build() => MoldState();

  // this method link id and ui in the map
  void updateValue(String fieldId, double? newValue) {
    final val = newValue ?? 0.0;

    if (fieldId == 'weight') {
      state = state.copyWith(weight: val);
    } else if (fieldId == 'numberMussles') {
      state = state.copyWith(numberMussels: val);
    } else if (fieldId == 'number') {
      state = state.copyWith(number: val);
    }
  }

  void reset() {
    state = MoldState(); // Used by the FAB
  }

  double get moldResult {
    if (state.weight == 0.0 || state.numberMussels == 0.0) return 0.0;
    return state.weight *
        state.numberMussels *
        (state.number > 0 ? state.number : 1.0);
  }
}

final moldProvider = NotifierProvider<MoldNotifier, MoldState>(() {
  return MoldNotifier();
});

// Frame

class FrameState {
  final double length;
  final double width;
  final double height;
  final double number;

  FrameState({
    this.length = 0.0,
    this.width = 0.0,
    this.height = 0.0,
    this.number = 1.0, // default 1 avoid to undone the calculation
  });

  FrameState copyWith({
    double? length,
    double? width,
    double? height,
    double? number,
  }) {
    return FrameState(
      length: length ?? this.length,
      width: width ?? this.width,
      height: height ?? this.height,
      number: number ?? this.number,
    );
  }
}

class FrameNotifier extends Notifier<FrameState> {
  @override
  FrameState build() => FrameState();

  final double ratioNumber = 1.13636364;

  void updateValue(String fieldId, double? newValue) {
    final val = newValue ?? 0.0;
    if (fieldId == 'length') state = state.copyWith(length: val);
    if (fieldId == 'width') state = state.copyWith(width: val);
    if (fieldId == 'height') state = state.copyWith(height: val);
    if (fieldId == 'number') state = state.copyWith(number: val);
  }

  void reset() {
    state = FrameState();
  }

  double get frameResult {
    if (state.length == 0 || state.width == 0 || state.height == 0) return 0.0;
    // Formula : L * l * h * nb * ratio
    return state.length *
        state.width *
        state.height *
        state.number *
        ratioNumber;
  }
}

final frameProvider = NotifierProvider<FrameNotifier, FrameState>(
  () => FrameNotifier(),
);
