import 'package:flutter/material.dart';

class NewsCard with ChangeNotifier {
  String title = '';
  String desc = '';
  String publishedAt = '';
  String source = '';
  String image = '';
  NewsCard(
      {required this.title,
      required this.desc,
      required this.publishedAt,
      required this.source,
      required this.image});
}

class NewsCardList with ChangeNotifier {
  int noOfCards = 0;
  List<NewsCard> listOfNewsCards = [];

  void addNewsCard(
      newsTitle, newsDesc, newsPublishedAt, newsSource, newsImage) {
    listOfNewsCards.add(
      NewsCard(
          title: newsTitle,
          desc: newsDesc,
          publishedAt: newsPublishedAt,
          source: newsSource,
          image: newsImage),
    );
    noOfCards++;
  }

  get lengthOfData {
    return listOfNewsCards.length;
  }

  void refreshData() {
    print('object');
    notifyListeners();
  }
}
