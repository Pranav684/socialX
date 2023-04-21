import 'package:flutter/material.dart';
import '../../consts/constant_values.dart';
import '../sign_up_page/sign_up_page.dart';
import '../login_page/login_page.dart';
import '../sign_in_page/upper_option_button.dart';
import 'package:provider/provider.dart';
import 'package:quantum_it_assignment/model/sign_in_model.dart';
import 'package:quantum_it_assignment/server_connection/api_call.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quantum_it_assignment/authentication/firebase_auth.dart';

class SignInBasePage extends StatefulWidget {
  const SignInBasePage({super.key});

  @override
  State<SignInBasePage> createState() => _SignInBasePageState();
}

class _SignInBasePageState extends State<SignInBasePage> {
  String? errorMessage = '';

  Future<void> signInWithEmailAndPassword() async {
    try {
      await initialAuthState.signInWithEmailAndPassword(
        email: controllerEmail.text,
        password: controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await initialAuthState.createUserWithEmailAndPassword(
        email: controllerEmail.text,
        password: controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final signInProvider = Provider.of<SignInProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: greyColor,
      appBar: AppBar(
        backgroundColor: redColor,
        title: Row(
          children: const [
            Text(
              'Social',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            Text(
              'X',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UpperOptionButton(),
          signInProvider.islogin ? const LoginPage() : const SignUpPage(),
          InkWell(
            onTap: () {
              islogin
                  ? signInWithEmailAndPassword()
                  : createUserWithEmailAndPassword();
              getNews();
              Navigator.pushNamed(context, '/homePage');
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: redColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Center(
                child: Text(
                  signInProvider.islogin ? 'LOGIN' : 'REGISTER',
                  style: TextStyle(
                    fontSize: 20,
                    color: signInProvider.accept || signInProvider.islogin
                        ? whiteColor
                        : greyColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
