//flutter imports
import 'package:flutter/material.dart';
//flutter imports

//controllers imports
import 'package:clear_chat_app/controllers/add_chat_controllers/add_chat_controller.dart';
//controllers imports

//core imports
import 'package:clear_chat_app/core/view/controller_client.dart';
//import 'package:clear_chat_app/core/controller/add_new_chat_screen_signals_enums.dart';
//core imports

//view parts imports
import 'package:clear_chat_app/views/add_chat_view/bottom_panel.dart';
//view parts imports

//import 'dart:developer' as dev;

class AddNewChatScreen extends StatelessWidget{

  final AddNewChatController controller;

  const AddNewChatScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('add_new_chat', style: TextStyle(fontSize: 16)),
        automaticallyImplyLeading: false,
      ),
      body: AddNewChatBody(controller: controller),
    );
  }
}

class AddNewChatBody extends StatefulWidget{

  final AddNewChatController controller;

  const AddNewChatBody({super.key, required this.controller});

  @override
  State<AddNewChatBody> createState() => AddNewChatState();
}

class AddNewChatState extends State<AddNewChatBody> with ContollerClient{

  String chatId = 'grgr';

  AddNewChatState();

  @override
  void updateMethod(Enum signal){
    switch(signal){
    }
  }

  @override
  void initState(){
    super.initState();
    widget.controller.viewNotifyMethod = updateMethod;
    chatId = widget.controller.chatSettings.chatId;
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Text(chatId),
        const Spacer(),
        ButtonPanel(controller: widget.controller)
      ],
    );
  }
}