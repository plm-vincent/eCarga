import 'package:ecarga_v1/Pages/Intros/intro1.dart';
import 'package:ecarga_v1/Pages/Intros/intro2.dart';
import 'package:ecarga_v1/Pages/Intros/intro3.dart';
import 'package:ecarga_v1/Pages/Auth/login.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardIntro extends StatefulWidget {
  const OnBoardIntro({Key? key}) : super(key: key);

  @override
  State<OnBoardIntro> createState() => _OnBoardIntroState();
}

class _OnBoardIntroState extends State<OnBoardIntro> {
  PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.70),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: WormEffect(
                activeDotColor: Color(0xFFAF2025),
                dotHeight: 12,
                dotWidth: 12,
                spacing: 10,
              ),
            ),
          ),
          if (!onLastPage)
            Positioned(
              top: 790,
              left: 70,
              child: GestureDetector(
                onTap: () {
                  _controller.jumpToPage(2);
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                      color: Color(0xFFAF2025),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          Positioned(
            top: 770,
            left: 230,
            child: Container(
              width: 150,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xFFAF2025),
              ),
              child: onLastPage
                  ? TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }));
                      },
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    )
                  : TextButton(
                      onPressed: () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 350),
                            curve: Curves.easeOut);
                      },
                      child: Center(
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
