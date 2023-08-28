//flutter imports
import 'package:flutter/material.dart';
//flutter imports

//controllers imports
import 'package:clear_chat_app/controllers/chat_controllers/chat_screen_controller.dart';
//controllers imports

//core imports
import 'package:clear_chat_app/core/view/controller_client.dart';
//core imports

//view parts imports
import 'package:clear_chat_app/views/chat_view/chat_list.dart';
//view parts imports

//import 'dart:developer' as dev;

class ChatScreen extends StatelessWidget{

  final ChatSreenController controller;

  const ChatScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('current_chat', style: TextStyle(fontSize: 16)),
        automaticallyImplyLeading: false,
      ),
      body: ChatBody(controller: controller),
    );
  }
}

class ChatBody extends StatefulWidget{

  final ChatSreenController controller;

  const ChatBody({super.key, required this.controller});

  @override
  State<ChatBody> createState() => ChatState();
}

class ChatState extends State<ChatBody> with ContollerClient{
  late TextEditingController _controller;
  String chatId = '';

  ChatState();

  @override
  void updateMethod(Enum signal){
    switch(signal){
    }
  }

  @override
  void initState(){
    super.initState();
    _controller = TextEditingController();
    widget.controller.viewNotifyMethod = updateMethod;
    chatId = widget.controller.chatId;
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Text(chatId),
        Expanded(child: ChatList(controller: widget.controller)),
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'New message',
          ),
          onSubmitted: (String value) {
            if (value != ''){
              widget.controller.addMessage(value);
              _controller.text = '';
            }
          },
        ),
      ],
    );
  }
}