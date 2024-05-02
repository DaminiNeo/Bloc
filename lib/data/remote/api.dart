import 'dart:isolate';

import 'package:demo_bloc/model/margarita_data_model.dart';
import 'package:demo_bloc/utils/constants.dart';
import 'package:dio/dio.dart';

class ApiCall {
  final dio = Dio();

  void getMargarita(SendPort sendPort) async {
    final Response response;
    List drinkList = [];
    ReceivePort demo1 = ReceivePort();

    response = await dio.get(margaritaLink);
    final data = Margarita.fromJson(response.data);
    drinkList.addAll(data.drinks);

    sendPort.send(demo1.sendPort);
    await for (var message in demo1) {
      if (message is List) {
        final myMessage = message[0];

        print(myMessage);

        sendPort.send(drinkList);
      }
    }
    // return drinkList;
  }
}
