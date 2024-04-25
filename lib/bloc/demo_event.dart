part of 'demo_bloc.dart';

@immutable
sealed class DemoEvent {}
class Increment extends DemoEvent{

}
class Decrement extends DemoEvent{

}
