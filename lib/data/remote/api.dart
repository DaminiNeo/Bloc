import 'dart:developer';

import 'package:demo_bloc/model/margarita_data_model.dart';
import 'package:demo_bloc/utils/constants.dart';
import 'package:dio/dio.dart';

class ApiCall {
  final dio = Dio();

  Future<List<dynamic>> getMargarita() async {
    final Response response;
    List drinkList = [];

    response = await dio.get(margaritaLink);
    final data = Margarita.fromJson(response.data);
    drinkList.addAll(data.drinks);
    print('drinklist => ${drinkList.length}');
    return drinkList;
  }
}
