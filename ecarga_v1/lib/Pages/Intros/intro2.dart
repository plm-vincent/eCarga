import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9EAEB),
      body: Stack(
        children: [
          Positioned(
            top: 100, // Adjust the top position as needed
            left: 15,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/logos/wheelchair2.png',
                width: 400,
                height: 300,
              ),
            ),
          ),
          Positioned(
            top: 450, // Adjust the top position as needed
            left: 45,
            right: 0,
            child: Container(
              child: Text(
                'Empowering Possibilities for\nPeople with Disabilities.',
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
                'We offer services that care for person \nwith motor disabilities. Hassle and \nanxiety-inducing rides no more!',
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
