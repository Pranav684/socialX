import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quantum_it_assignment/consts/constant_values.dart';
import 'package:quantum_it_assignment/model/sign_in_model.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quantum_it_assignment/authentication/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
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
            'Create an Account',
            style: TextStyle(
                color: redColor, fontSize: 30, fontWeight: FontWeight.bold),
            softWrap: true,
          ),
          SizedBox(
            width: width * (70 / 100),
            // height: 50,
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                suffix: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
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
            child: IntlPhoneField(
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.phone,
                  color: redColor,
                ),
                labelText: 'Contact no',
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
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
          SizedBox(
            width: width * (70 / 100),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16.0),
                  child: Checkbox(
                    value: signInProvider.accept,
                    fillColor: redMaterialColor,
                    checkColor: whiteColor,
                    onChanged: (value) {
                      signInProvider.setAcceptance(value);
                    },
                  ),
                ),
                const Text(
                  'I agree with ',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  'terms & conditions',
                  style: TextStyle(
                      color: redColor,
                      fontSize: 15,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
          SizedBox(
            width: width * (70 / 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account ?'),
                InkWell(
                  onTap: () {
                    signInProvider.setLoginValue(true);
                  },
                  child: Text(
                    'Sign In',
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
