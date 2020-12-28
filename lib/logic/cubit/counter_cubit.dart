import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:state_mngmt/constants/enums.dart';

import 'package:state_mngmt/logic/cubit/internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;
  CounterCubit({@required this.internetCubit})
      : super(CounterState(counterValue: 0)) {
        monitorInternetCubit();
      }

  StreamSubscription<InternetState> monitorInternetCubit() {
    return internetStreamSubscription=internetCubit.listen((internetstate) {
        if(internetstate is InternetConnected && internetstate.connectionType==ConnectionType.Wifi){
          increment();
        }else if(internetstate is InternetConnected && internetstate.connectionType==ConnectionType.Mobile){
          decrement();
        }else {

        }
      });
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncrement: true));
  void decrement() => emit(
      CounterState(counterValue: state.counterValue - 1, wasIncrement: false));
  void reset() => emit(CounterState(counterValue: 0));

  @override
    Future<void> close() {
      // TODO: implement close
      internetStreamSubscription.cancel();
      return super.close();
    }
}
