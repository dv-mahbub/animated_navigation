import 'dart:math';

import 'package:animated_navigation/views/second_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stylish_text/stylish_text.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  double _width = 0;
  double _height = 0;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 70,
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 5),
                color: Colors.green,
                child: const Text(
                  'Page 1',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Spacer(
                flex: 2,
              ),
              Lottie.asset('assets/json/animate1.json', height: 250),
              Spacer(
                flex: 1,
              ),
              TypewriterText(
                'This is page no 1\nLet\'s navigate to \nPage 2.',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade800),
                textAlign: TextAlign.center,
              ),
              Spacer(
                flex: 2,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      final random = Random();
                      _width = 700;
                      _height = 1200;

                      _borderRadius =
                          BorderRadius.circular(random.nextInt(100).toDouble());
                    });

                    Future.delayed(const Duration(milliseconds: 350), () {
                      setState(() {
                        _width = 0;
                        _height = 0;
                      });
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SecondPage()));
                    });
                  },
                  child: const Text('Navigate to Page 2')),
              Spacer(
                flex: 5,
              ),
            ]),
          ),
          Center(
            child: AnimatedContainer(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage('assets/images/texture.jpg'),
                    fit: BoxFit.cover),
                borderRadius: _borderRadius,
              ),
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
            ),
          ),
        ],
      ),
    );
  }
}
