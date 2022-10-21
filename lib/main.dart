import 'package:flutter/material.dart';
import 'package:newnoticias/pages/providers/home.page.dart';

import 'package:intro_views_flutter/intro_views_flutter.dart';

void main() => runApp(MyApp());

/// App widget class.
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // Making list of pages needed to pass in IntroViewsFlutter constructor.
  final pages = [
    PageViewModel(
      pageColor: Color.fromARGB(171, 210, 212, 214),
      // iconImageAssetPath: 'assets/air-hostess.png',
      bubble: Image.asset('assets/airplane.png'),
      body: const Text(
        'INSTITUTO NACIONAL DE VIGILANCIA DE MEDICAMENTOS Y ALIMENTOS INVIMA',
      ),

      title: const Text(
        'INFOINVIMA',
      ),

      titleTextStyle: const TextStyle(
          fontFamily: 'MyFont', color: Color.fromARGB(255, 22, 21, 21)),
      bodyTextStyle: const TextStyle(
          fontFamily: 'MyFont', color: Color.fromARGB(255, 55, 53, 53)),
      mainImage: Image.asset(
        'assets/airplane.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
    ),
    PageViewModel(
      pageColor: const Color(0xFF8BC34A),
      iconImageAssetPath: 'assets/waiter.png',
      body: const Text(
        'INFORMACIÓN DE LOS CÓDIGOS ÚNICOS DE MEDICAMENTOS PARA LOS REGISTROS SANITARIOS VIGENTES.',
      ),
      title: const Text('INFOINVIMA'),
      mainImage: Image.asset(
        'assets/hotel.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle:
          const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    PageViewModel(
      pageBackground: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [0.0, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            tileMode: TileMode.repeated,
            colors: [
              Colors.blue,
              Colors.blueAccent,
            ],
          ),
        ),
      ),
      iconImageAssetPath: 'assets/logo.png',
      body: const Text(
        'INFORMACIÓN DE LOS CÓDIGOS ÚNICOS DE MEDICAMENTOS PARA LOS REGISTROS SANITARIOS VIGENTES.',
      ),
      title: const Text('INFOINVIMA'),
      mainImage: Image.asset(
        'assets/logo.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle:
          const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InfoInvima',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          showNextButton: true,
          showBackButton: true,
          onTapDoneButton: () {
            // Use Navigator.pushReplacement if you want to dispose the latest route
            // so the user will not be able to slide back to the Intro Views.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => HomePage1()),
            );
          },
          pageButtonTextStyles: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}

/// Home Page of our example app.
class HomePage1 extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: HomePage(),
      ),
    );
  }
}

/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Api Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomePage(),
    );
  }
}
*/