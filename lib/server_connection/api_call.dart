import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quantum_it_assignment/consts/constant_values.dart';
import 'package:quantum_it_assignment/server_connection/data_controller.dart';

import '../database/localDatabase.dart';

getNews() async {
  http.Response response = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/everything?q=tesla&from=2023-03-21&sortBy=publishedAt&apiKey=$apiKey'),
  );

  decodedData = json.decode(response.body);
  var no = decodedData['totalResults'];
  if (decodedData.isNotEmpty) {
    print('decodedData: $no');
    await serverToDatabase(decodedData, databaseObjectInitial);
  }
  // serverToModel(decodedData, newsCardListInitaial);
}
