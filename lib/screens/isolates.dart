import 'dart:async';
import 'dart:isolate';

import 'package:demo_bloc/data/remote/api.dart';

class DemoIsolate1 {
  Future createIsolate() async {
    ReceivePort myReceivePort = ReceivePort();
    await Isolate.spawn(heavyComputationTask, myReceivePort.sendPort);
    SendPort demoSendPort;
    ReceivePort demoPort = ReceivePort();
    myReceivePort.listen((message) {
      if (message is SendPort) {
        demoSendPort = message;
        demoSendPort.send(['Hi Demo, I am Damini']);
      } else {
        print('Demo response -> $message');
      }
    });

    final mikeResponse = await demoPort.first;
    print("MIKE'S RESPONSE: ==== $mikeResponse");
  }

  void heavyComputationTask(SendPort mySendPort) async {
    ReceivePort demoReceiverPort = ReceivePort();
    mySendPort.send(demoReceiverPort.sendPort);
    await for (var message in demoReceiverPort) {
      if (message is List) {
        final myMessage = message[0];

        print(myMessage);

        mySendPort.send("You're Damini, and I'm Demo");
      }
    }
  }

  void heavyTask(SendPort mySendPort) async {
    ReceivePort damini1 = ReceivePort();
    mySendPort.send(damini1.sendPort);
    await for (var message in damini1) {
      if (message is String) {
        // final response = message;
      }
      mySendPort.send('hiii,, Hello world');
    }
  }

  createIsolate1() async {
    ApiCall apiCall = ApiCall();
    ReceivePort demo = ReceivePort();
    await Isolate.spawn(apiCall.getMargarita, demo.sendPort);

    ReceivePort demoPort = ReceivePort();
    demo.listen((message) {
      if (message is SendPort) {
        final demoSendPort = message;
        demoSendPort.send(['hii']);
      } else {
        print('$message');
      }
    });
    final mikeResponse = await demoPort.first;
    print("MIKE'S RESPONSE: ==== $mikeResponse");
  }
}
