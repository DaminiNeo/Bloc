import 'package:flutter/material.dart';

class Temp extends StatefulWidget {
  const Temp({super.key});

  @override
  State<Temp> createState() => _TempState();
}

class _TempState extends State<Temp> {
  List<int> randomValue = [
    31,
    60,
    19,
    50,
    100,
  ];
  @override
  void didUpdateWidget(oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    Future.delayed(Duration(seconds: 2), () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: List.generate(
            randomValue.length,
            (index) => Text(
                  '${randomValue[index]}',
                  style: TextStyle(color: Colors.grey),
                )),
      ),
    );
  }
}
