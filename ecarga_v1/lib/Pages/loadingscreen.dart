import 'package:ecarga_v1/Pages/Intros/onboardintro.dart';
import 'package:flutter/material.dart';
import 'package:ecarga_v1/Pages/Intros/intro1.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({required Key key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration:
          Duration(milliseconds: 1000), // Set the duration of the animation
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward(); // Start the animation
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 7000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => OnBoardIntro()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAF2025),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Image.asset(
            'assets/logos/Icon&Name.gif',
            width: 280,
            height: 450,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
