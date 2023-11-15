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

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/4.jpeg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
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
         style: ElevatedButton.styleFrom(backgroundColor:Color.fromARGB(255, 193, 20, 8) ),
          
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
          title: "Full Screen Page",
          body:
              "Pages can be full screen as well.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
          image: _buildFullscreenImage(),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 5,
            imageFlex: 4,
            safeArea: 100,
          ),
        ),

        /// page 2
        PageViewModel(
          title: "Full Screen Page",
          body:
              "Pages can be full screen as well.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
          image: Image.asset('assets/2.jpg'),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 5,
            imageFlex: 4,
            safeArea: 100,
          ),
        ),

        //page3

        PageViewModel(
          title: "Full Screen Page",
          body:
              "Pages can be full screen as well.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
          image: Image.asset('assets/3.jpg'),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 5,
            imageFlex: 10,
            safeArea: 100,
          ),
        ),

        //page 4

        PageViewModel(
          title: "Full Screen Page",
          body:
              "Pages can be full screen as well.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
          image: Image.asset('assets/4.jpg'),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 0,
            imageFlex: 4,
            safeArea: 10,
          ),
        ),

        //page 5

        PageViewModel(
            title: "Full Screen Page",
            body:
                "Pages can be full screen as well.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
            image: Image.asset(
              'assets/5.jpg',
              fit: BoxFit.fill,
            ),
            decoration: PageDecoration(
                //pageColor: Colors.transparent,
                boxDecoration: BoxDecoration(color: Colors.white))),

        //page 6

        PageViewModel(
          title: "Full Screen Page",
          body:
              "Pages can be full screen as well.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
          image: Image.asset('assets/6.jpg'),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 5,
            imageFlex: 4,
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
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromARGB(255, 205, 12, 12))),
      next: const Icon(Icons.arrow_forward,color: Color.fromARGB(255, 213, 14, 14),),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromARGB(255, 213, 14, 14),)),
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
          
          borderRadius: BorderRadius.all(Radius.circular(25.0),),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
