part of 'margarita_bloc.dart';

@immutable
sealed class MargaritaState {}

final class LoadingState extends MargaritaState {}

final class MargaritaInitial extends MargaritaState {}

final class MargaritaDataReceived extends MargaritaState {
  final List<dynamic> result;
  MargaritaDataReceived({required this.result});
}
