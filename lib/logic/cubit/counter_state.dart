part of 'counter_cubit.dart';

// @immutable
// abstract class CounterState {}

class CounterState {
  int counterValue;
  bool wasIncrement;
  CounterState({
   @required this.counterValue,
    this.wasIncrement,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is CounterState &&
      o.counterValue == counterValue &&
      o.wasIncrement == wasIncrement;
  }

  @override
  int get hashCode => counterValue.hashCode ^ wasIncrement.hashCode;
}
