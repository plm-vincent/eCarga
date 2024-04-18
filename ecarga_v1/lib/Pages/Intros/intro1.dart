import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9EAEB),
      body: Stack(
        children: [
          Positioned(
            top: 100, // Adjust the top position as neede
            left: 15,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/logos/wheelchair1.png',
                width: 400,
                height: 300,
              ),
            ),
          ),
          Positioned(
            top: 450, // Adjust the top position as needed
            left: 47,
            right: 0,
            child: Container(
              child: Text(
                'eCARGA,\nYour ride, Carried with care.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    fontFamily: 'Metropolis'),
              ),
            ),
          ),
          Positioned(
            top: 530, // Adjust the top position as needed
            left: 48,
            right: 0,
            child: Container(
              child: Text(
                'We help you to arrive at your \ndestination safely by providing a \ncustomized experience designed \nspecifically for you.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 17.5,
                  fontFamily: 'Metropolis',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
