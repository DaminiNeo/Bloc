part of 'demo_bloc.dart';

@immutable
sealed class DemoState {}

final class DemoInitial extends DemoState {}

final class IncrementState extends DemoState {
  final int counter;
  IncrementState({required this.counter});
}
