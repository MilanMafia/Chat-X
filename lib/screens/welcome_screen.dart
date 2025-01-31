import 'package:chatx/screens/login_screen.dart';
import 'package:chatx/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatx/Button/button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      upperBound: 100,
    );

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.jpg'),
            fit: BoxFit.cover,
            opacity: controller.value,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  color: Colors.blueGrey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Hero(
                              tag: 'logo',
                              child: Container(
                                child: Image.asset('images/logo.png'),
                                height: 80,
                              ),
                            ),
                            SizedBox(width: 20),
                            DefaultTextStyle(
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                              child: AnimatedTextKit(
                                totalRepeatCount: 1,
                                animatedTexts: [
                                  TypewriterAnimatedText('Chat_X',
                                      speed: Durations.long1)
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 48.0,
                        ),
                        Button(
                          title: 'Log In',
                          color: Colors.blue,
                          onpressed: () {
                            Navigator.pushNamed(context, LoginScreen.id);
                          },
                        ),
                        Button(
                          title: 'Register',
                          color: Colors.lightBlueAccent,
                          onpressed: () {
                            Navigator.pushNamed(context, RegistrationScreen.id);
                          },
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
