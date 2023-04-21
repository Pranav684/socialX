import 'package:flutter/material.dart';
import 'package:quantum_it_assignment/model/news_cards.dart';
import 'home/home_page.dart';
import 'pages/sign_in_page/sign_in_base_page.dart';
import 'package:provider/provider.dart';
import 'package:quantum_it_assignment/model/sign_in_model.dart';
import 'consts/routes.dart';
import './consts/constant_values.dart';
import 'database/localDatabase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quantum_it_assignment/authentication/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // value: islogin,
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => SignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => newsCardListInitial,
        ),
        ChangeNotifierProvider(
          create: (ctx) => initialAuthState,
        ),
      ],

      child: MaterialApp(
        onGenerateRoute: generateRoute,
        initialRoute: '/',
        home: StreamBuilder(
          stream: initialAuthState.authStateChanges,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const SignInBasePage();
            }
          }),
        ),
      ),
    );
  }
}
