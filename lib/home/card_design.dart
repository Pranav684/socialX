import 'package:flutter/material.dart';
import 'package:quantum_it_assignment/consts/constant_values.dart';

// ignore: must_be_immutable
class CardBuilder extends StatelessWidget {
  String title = '';
  String desc = '';
  String publishedAt = '';
  String source = '';
  String image = '';
  CardBuilder(
      {super.key,
      required this.title,
      required this.desc,
      required this.publishedAt,
      required this.source,
      required this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: greyColor,
            blurRadius: 3,
            spreadRadius: 5,
          )
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        color: whiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width * (70 / 100),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$publishedAt $source',
                  style: TextStyle(color: greyColor, fontSize: 10),
                ),
              ),
              Container(
                width: width * (70 / 100),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  softWrap: true,
                  style: TextStyle(
                      color: blueColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: width * (70 / 100),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  desc,
                  softWrap: true,
                  style: TextStyle(color: blueColor, fontSize: 10),
                ),
              ),
            ],
          ),
          image != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: SizedBox(
                      height: 70,
                      width: 80,
                      child: Image.network(
                        image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.image,
                        size: 80,
                      )),
                ),
        ],
      ),
    );
  }
}
