import 'package:bloc/bloc.dart';
import 'package:demo_bloc/data/remote/api.dart';
import 'package:meta/meta.dart';

part 'margarita_event.dart';
part 'margarita_state.dart';

final apiCall = ApiCall();

class MargaritaBloc extends Bloc<MargaritaEvent, MargaritaState> {
  MargaritaBloc() : super(MargaritaInitial()) {
    on<getDrinksData>((event, emit) async {
      final List<dynamic> result = await apiCall.getMargarita();
      print('data => $result');
      // TODO: implement event handler
      emit(MargaritaDataReceived(result: result));
    });
  }
}
