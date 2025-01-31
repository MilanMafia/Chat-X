import 'package:flutter/material.dart';
import 'package:chatx/Button/button.dart';
import 'package:chatx/constants.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(height: 20),
                        Hero(
                          tag: 'logo',
                          child: Container(
                            height: 200.0,
                            child: Image.asset('images/logo.png'),
                          ),
                        ),
                        SizedBox(
                          height: 48.0,
                        ),
                        TextField(
                          style: TextStyle(color: Colors.white),
                          onChanged: (value) {
                            //Do something with the user input.
                          },
                          decoration: kInputDecoration.copyWith(
                              hintText: 'Enter Email'),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        TextField(
                          style: TextStyle(color: Colors.white),
                          onChanged: (value) {
                            //Do something with the user input.
                          },
                          decoration: kInputDecoration.copyWith(
                              hintText: 'Enter Password'),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Button(
                          title: 'Register',
                          color: Colors.lightBlueAccent,
                          onpressed: () {},
                        ),
                        SizedBox(height: 10)
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
