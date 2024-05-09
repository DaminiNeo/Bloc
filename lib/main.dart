import 'package:demo_bloc/bloc/margarita_bloc.dart';
import 'package:demo_bloc/screens/counter.dart';
import 'package:demo_bloc/screens/isolates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/test.dart';
import 'dart:async';
import 'bloc/demo_bloc.dart';

void main() {
  runApp(const MyApp());
  group('test for increment, decrement', () {
    test('value should be incremented', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });
    test('value should be decremented', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });
  });
  List originalList = [24, 53, 39100, 2000, 311, 654, 1, 0];

  for (var i = 0; i < originalList.length; i++) {
    for (var j = i + 1; j < originalList.length; j++) {
      if (originalList[i] < originalList[j]) {
        print('i=> ${originalList[i]} amd j ${originalList[j]}');
      } else {
        int tempVal = originalList[j];
        originalList[j] = originalList[i];
        originalList[i] = tempVal;

        print('baseList => $originalList');
      }
    }
  }
  String name = 'today is a wednesday';
  List getIndexes = [];
  List getCount = [];
  var i;
  for (var i = 0; i < name.length; i++) {
    if (name[i].contains('a')) {
      getIndexes.add(i);
    }
  }
  for (var i = getIndexes.first; i <= getIndexes[1]; i++) {
    getCount.add(name[i]);
  }
  int count = 0;
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
