import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quantum_it_assignment/consts/constant_values.dart';
import 'package:quantum_it_assignment/model/sign_in_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // controllerEmail = TextEditingController();
    // controllerPassword = TextEditingController();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final signInProvider = Provider.of<SignInProvider>(context);

    return Container(
      height: height * (70 / 100),
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'SignIn into your Account',
            style: TextStyle(color: redColor, fontSize: 30),
            softWrap: true,
          ),
          SizedBox(
            width: width * (70 / 100),
            // height: 50,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (input) {
                return isValidEmail() ? null : "Check your email";
              },
              controller: controllerEmail,
              decoration: InputDecoration(
                labelText: 'Email',
                suffix: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.mail_rounded,
                    color: redColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: width * (70 / 100),
            // height: 50,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (input) {
                return isValidPassword() ? null : "Check your Password";
              },
              obscureText: true,
              controller: controllerPassword,
              decoration: InputDecoration(
                labelText: 'Password',
                suffix: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.lock,
                    color: redColor,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: width * (70 / 100),
            alignment: Alignment.centerRight,
            child: Text(
              'Forgot Password ?',
              style: TextStyle(color: redColor, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            'Login With',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            width: width * (70 / 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/icons/google.png',
                    height: 30,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    'assets/icons/facebook.png',
                    height: 30,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: width * (70 / 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account ?'),
                InkWell(
                  onTap: () {
                    controllerEmail = TextEditingController();
                    controllerPassword = TextEditingController();
                    signInProvider.setLoginValue(false);
                  },
                  child: Text(
                    'Register Now',
                    style:
                        TextStyle(color: redColor, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
