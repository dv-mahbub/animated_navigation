import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  double _width = 700;
  double _height = 1200;
  final BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  void initState() {
    Future.delayed(const Duration(microseconds: 1), () {
      setState(() {
        _width = 0;
        _height = 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 70,
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 5),
                color: Colors.blue,
                child: const Text(
                  'Page 2',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const Spacer(),
              Lottie.asset('assets/json/animate2.json'),
              const Spacer(
                flex: 2,
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
