import 'package:flutter/material.dart';
import 'package:quantum_it_assignment/model/news_cards.dart';
import 'package:quantum_it_assignment/database/database_model.dart';

import '../authentication/firebase_auth.dart';

bool islogin = false;

Color redColor = Colors.red;
Color blueColor = Colors.blue;
Color whiteColor = Colors.white;
Color greyColor = Color.fromARGB(255, 172, 172, 172);

int i = 10;
int noOfItems = 0;

MaterialStateProperty<Color?>? redMaterialColor =
    const MaterialStatePropertyAll(Colors.red);

const String apiKey = '5fab52bfa47846e0aaae67f42b01d215';

Map decodedData = {};
var newsTable = 'newsTable';
Auth initialAuthState = Auth();
NewsCardList newsCardListInitial = NewsCardList();
DatabaseObject databaseObjectInitial = DatabaseObject();
var fetchedInternalData = null;

TextEditingController controllerEmail = TextEditingController();
TextEditingController controllerPassword = TextEditingController();

bool isValidEmail() {
  return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(controllerEmail.text);
}

bool isValidPassword() {
  return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
      .hasMatch(controllerPassword.text);
}
