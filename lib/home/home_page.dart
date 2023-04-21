import 'package:flutter/material.dart';
import 'package:quantum_it_assignment/authentication/firebase_auth.dart';
import 'package:quantum_it_assignment/database/database_model.dart';
import 'package:quantum_it_assignment/model/news_cards.dart';
import 'card_design.dart';
import 'package:provider/provider.dart';
import 'package:quantum_it_assignment/server_connection/data_controller.dart';
import 'package:quantum_it_assignment/consts/constant_values.dart';
import 'package:quantum_it_assignment/database/localDatabase.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  waitASec() async {
    fetchedInternalData = await DatabaseObject().fetchInternalData();
    databaseToModel(fetchedInternalData, newsCardListInitial);
  }

  void initState() {
    super.initState();
    waitASec();
  }

  @override
  Widget build(BuildContext context) {
    var newsCardList = Provider.of<NewsCardList>(context);
    var listOfCards = newsCardList.listOfNewsCards;
    print(listOfCards.length);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        actions: [
          IconButton(
              onPressed: () {
                Auth().signOut();
                deleteData();
              },
              icon: const Icon(Icons.logout_rounded))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: listOfCards.isNotEmpty
            ? ListView.builder(
                itemCount: newsCardList.lengthOfData,
                itemBuilder: (ctx, i) {
                  return CardBuilder(
                      title: listOfCards[i].title,
                      desc: listOfCards[i].desc,
                      publishedAt: listOfCards[i].publishedAt,
                      source: listOfCards[i].source,
                      image: listOfCards[i].image);
                })
            : const Center(
                child: Text('No News Yet !'),
              ),
      ),
    );
  }
}
