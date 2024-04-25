import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'demo_event.dart';
part 'demo_state.dart';

class DemoBloc extends Bloc<DemoEvent, DemoState> {
  int counterValue = 0;
  DemoBloc() : super(DemoInitial()) {
    on<Increment>((event, emit) {
      print('');
      counterValue += 1;
      emit(IncrementState(counter: counterValue));
    });
  }
}
