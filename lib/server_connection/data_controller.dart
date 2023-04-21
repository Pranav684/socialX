import 'package:quantum_it_assignment/consts/constant_values.dart';
import 'package:quantum_it_assignment/database/database_model.dart';

import '../model/news_cards.dart';

serverToDatabase(decodedData, DatabaseObject modelClass) async {
  print('into sTd');
  List listOfData = decodedData['articles'];
  print(listOfData.length);
  for (var i in listOfData) {
    // print(i['source']['name']);
    var newsSource = i['source']['name'];
    var newsTitle = i['title'];
    var newsDesc = i['description'];
    var newsImageUrl = i['urlToImage'];
    var newsPublishedAt = i['publishedAt'];
    modelClass.insertTableData(
      newsTitle,
      newsDesc,
      newsPublishedAt,
      newsSource,
      newsImageUrl,
    );
  }
  await modelClass.modelToDatabase();
}

databaseToModel(fetchedInternalData, NewsCardList modelClass) async {
  modelClass.noOfCards = fetchedInternalData.length;
  print(modelClass.noOfCards);
  for (var i in fetchedInternalData) {
    var newsSource = i['newsSource'];
    var newsTitle = i['newsTitle'];
    var newsDesc = i['newsTitle'];
    var newsImageUrl = i['newsImage'];
    var newsPublishedAt = i['newsPublishedAt'];
    modelClass.addNewsCard(
      newsTitle,
      newsDesc,
      newsPublishedAt,
      newsSource,
      newsImageUrl,
    );
  }
  modelClass.refreshData();
}
