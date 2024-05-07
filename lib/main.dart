import 'package:demo_bloc/bloc/margarita_bloc.dart';
import 'package:demo_bloc/screens/inheritedWidget/inherited_widget.dart';
import 'package:demo_bloc/screens/isolates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'bloc/demo_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DemoBloc(),
        ),
        BlocProvider(
          create: (context) => MargaritaBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Margarita(),
      ),
    );
  }
}

class Debouncer {
  final int milliseconds;
  Timer? _timer;
  Debouncer({required this.milliseconds});
  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class DemoWidget extends StatelessWidget {
  const DemoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _debouncer = Debouncer(milliseconds: 500);

    String name = UserDataInheritedWidget.of(context)!.userName;
    return Text(name);
  }
}

class Margarita extends StatelessWidget {
  const Margarita({super.key});

  @override
  Widget build(BuildContext context) {
    // context.read<MargaritaBloc>().add(getDrinksData());
    DemoIsolate1().createIsolate1();
    return Scaffold(
      body: SafeArea(child: BlocBuilder<MargaritaBloc, MargaritaState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          }
          if (state is MargaritaDataReceived) {
            return Column(children: [
              ListView.builder(
                itemCount: state.result.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Text('${state.result[index]['strDrink']}');
                },
              ),
            ]);
          }

          return Column(
            children: [Text('dnsjnd')],
          );
        },
      )),
    );
  }
}
