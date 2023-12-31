import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sos/view/bottomnavigation/bottombar.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  IntroScreenState createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => Bottombar()),
    );
  }

  // Widget _buildFullscreenImage() {
  //   return Image.asset(
  //     'assets/4.jpeg',
  //     fit: BoxFit.cover,
  //     height: double.infinity,
  //     width: double.infinity,
  //     alignment: Alignment.center,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
        // titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
        // bodyTextStyle: bodyStyle,
        // bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        // pageColor: Colors.white,
        //imagePadding: EdgeInsets.zero,
        );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,

      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 193, 20, 8)),
          child: const Text(
            'Let\'s go right away!',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),
      pages: [
        //page 1
        PageViewModel(
          image: Center(
              child: Container(
                  height: 800,
                  width: double.infinity,
                  child: Image.asset('assets/c1.png', fit: BoxFit.cover))),
          title: "",
          // Welcome to Rapid Responce!

          body: "",
          //  Your ultimate companion for staying safe and prepared in any situation,Your safety is our priority,
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 4,
            imageFlex: 14,
            safeArea: 100,
          ),
        ),

        /// page 2
        PageViewModel(
          image: Center(
              child: Container(
                  height: 800,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/c2.png',
                    fit: BoxFit.cover,
                  ))),
          title: ""
          // SOS Button !
          ,
          body: "",
          //There is a SOS button for emergencies.After pressing that butoon an alert call or message will be sent,
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 15,
            imageFlex: 2,
            safeArea: 100,
          ),
        ),

        //page3

        PageViewModel(
          image: Center(
              child: Container(
                  height: 800,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/c3.png',
                    fit: BoxFit.cover,
                  ))),
          title: ""
          // Personalized  Emergency Contacts !
          ,
          body: "",
          //There are 2 categories in contact Genaral and Personal. We can add the desired contacts in personal and In general you can see the emergency contacts like Polica,Fire Force,Disaster Management
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 13,
            imageFlex: 1,
            safeArea: 100,
          ),
        ),

        //page 4

        PageViewModel(
          image: Center(
              child: Container(
                  height: 800,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/c4.png',
                    fit: BoxFit.cover,
                  ))),
          title: "",

          // Emergency Support At Your Fingertip !
          body: "",

          // Find crucial information to handle variuos kinds of emergencies at all time
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 10,
            imageFlex: 1,
            safeArea: 100,
          ),
        ),

        //page 5

        PageViewModel(
          image: Center(
              child: Container(
                  height: 800,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/c5.png",
                    fit: BoxFit.cover,
                  ))),
          title: "",

          // Real Time News
          body: "",

          // We bring recent natural disasters news and update special reports to all users
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 5,
            safeArea: 100,
          ),
        ),

        //page 6

        PageViewModel(
          image: Center(
              child: Container(
                  height: 800,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/c6.png',
                    fit: BoxFit.cover,
                  ))),
          title: "",

          // Prsonolized Theme
          body: "",

          // You can switch theme as your need
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 8,
            imageFlex: 1,
            safeArea: 100,
          ),
        ),
      ],

      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 205, 12, 12))),
      next: const Icon(
        Icons.arrow_forward,
        color: Color.fromARGB(255, 213, 14, 14),
      ),
      done: const Text('Done',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 213, 14, 14),
          )),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        // color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
