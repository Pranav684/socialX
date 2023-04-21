import 'package:flutter/material.dart';
import '../../consts/constant_values.dart';
import 'package:provider/provider.dart';
import 'package:quantum_it_assignment/model/sign_in_model.dart';

class UpperOptionButton extends StatefulWidget {
  UpperOptionButton({Key? key}) : super(key: key);

  @override
  State<UpperOptionButton> createState() => _UpperOptionButtonState();
}

class _UpperOptionButtonState extends State<UpperOptionButton> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final signInProvider = Provider.of<SignInProvider>(context);
    return Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: redColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                controllerEmail = TextEditingController();
                controllerPassword = TextEditingController();
                signInProvider.setLoginValue(true);
              },
              child: Container(
                width: (width) / 2,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: signInProvider.islogin ? whiteColor : redColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    border: Border.all(color: redColor, width: 2)),
                child: const Center(
                    child: Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 20),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                controllerEmail = TextEditingController();
                controllerPassword = TextEditingController();
                signInProvider.setLoginValue(false);
              },
              child: Container(
                width: (width) / 2,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: signInProvider.islogin ? redColor : whiteColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    border: Border.all(color: redColor, width: 2)),
                child: const Center(
                    child: Text(
                  'SIGN UP',
                  style: TextStyle(fontSize: 20),
                )),
              ),
            ),
          ],
        ));
  }
}
