import 'package:flutter/material.dart';

//controller imports
import 'package:clear_chat_app/controllers/main_controllers/main_screen_controller.dart';
//controller imports

//models imports
//import 'package:clear_chat_app/models/main_models/main_screen_models.dart';
//models imports

//view parts imports
//import 'package:clear_chat_app/views/main_view/chat_list_element.dart';
import 'package:clear_chat_app/views/main_view/bottom_panel.dart';
import 'package:clear_chat_app/views/main_view/chat_list.dart';
//view parts imports

class MainScreen extends StatelessWidget {
  final MainSreenController controller;

  const MainScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'clear_chat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true, 
      ),
      home: MyHomePage(controller: controller),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final MainSreenController controller;

  const MyHomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('ch_id: 0000-aaaa-0000-bbbb', style: TextStyle(fontSize: 16)),
      ),
      body: Column(
        children: [
          Expanded(child: ChatsList(controller: controller)),
          ButtonPanel(controller: controller)
        ],
      )
    );
  }
}
