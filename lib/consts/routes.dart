import 'package:flutter/material.dart';
import 'package:quantum_it_assignment/home/home_page.dart';
import 'package:quantum_it_assignment/pages/sign_in_page/sign_in_base_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/signInPage':
      return MaterialPageRoute(builder: (context) => const SignInBasePage());
    case '/homePage':
      return MaterialPageRoute(builder: (context) => const HomePage());
  }
  return MaterialPageRoute(builder: (context) => const SignInBasePage());
}
