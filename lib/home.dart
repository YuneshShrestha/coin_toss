import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  String image = "head";
  List<String> images = ["head", "tail"];
  int rotateCoin = 10;
  double m = 1;
  double p = 0;
  // String state = head;
  void rotate() {
    var flip = Timer.periodic(const Duration(milliseconds: 100), (Timer t) {
      image == "head" ? "tail" : "head";
      if (m == 1) {
        setState(() {
          m = 0.142;
          p = 100;
          if (image == "head") {
            image = "tail";
          } else {
            image = "head";
          }
          // rotateCoin--;
        });
      } else {
        setState(() {
          m = 1;
          p = 0;
          // rotateCoin--;
        });
      }
    });
    Future.delayed(const Duration(seconds: 5), () {
      flip.cancel();
      setflipped();
    });
  }

  void setflipped() {
    Random random = Random();
    String currentImage = images[random.nextInt(2)];

    setState(() {
      image = currentImage;
      m = 1;
      p = 0;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 100.0, bottom: 30.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: p),
                  width: 200,
                  height: 200 * m,
                  //  child: Image.asset('images/head.jpg'),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "images/$image.jpg",
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
                // const SizedBox(
                //   width: 200,
                // ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      rotate();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff8a2be2),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Toss The Coin",
                      textScaleFactor: 2.0,
                    ),
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
