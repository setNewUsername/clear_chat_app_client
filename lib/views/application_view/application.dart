import 'dart:async';
import 'package:flutter/material.dart';
import 'package:clear_chat_app/controllers/application_controllers/application_controller.dart';

class Application extends StatelessWidget{
  final ApplicationController controller;

  const Application({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(controller: controller),
    );
  }
}

class SplashScreen extends StatefulWidget{
  final ApplicationController controller;

  const SplashScreen({super.key, required this.controller});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>{
  
  Timer scheduleTimeout([int milliseconds = 10000]) =>
    Timer(Duration(milliseconds: milliseconds), changeScreen);
  
  void updateMethod(){}

  //sets up main screen
  void changeScreen(){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => widget.controller.createMainScreen()),
    );
  }

  @override
  void initState(){
    super.initState();
    widget.controller.notifyViewFunctionPtr = updateMethod;
  }

  @override
  void dispose(){
    super.dispose();
  }

  Future<void> executeAfterBuild(BuildContext context) async {
    await Future.delayed(Duration.zero);
    //3 secs timeout before main screen appears (dujmmy timer)
    scheduleTimeout(1 * 1000);
  }

  @override
  Widget build(BuildContext context) {
    executeAfterBuild(context);
    return Scaffold();
  }
}