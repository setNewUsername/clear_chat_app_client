import 'package:flutter/material.dart';

//controller imports
import 'package:clear_chat_app/controllers/main_controllers/main_screen_controller.dart';
//controller import

class ChatListElement extends StatefulWidget{

  final MainSreenController controller;
  final String chatId;

  const ChatListElement({super.key, required this.chatId, required this.controller});

  @override
  State<ChatListElement> createState() => ChatListElementState();
}

class ChatListElementState extends State<ChatListElement>{

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        padding: const EdgeInsets.all(10),
        color: Theme.of(context).primaryColorLight,
        child: Row(
          children: [
              Text('chat id: ${widget.chatId}'),
              const Spacer(),
              const Icon(
                Icons.timer,
                size: 20.0,
              )
            ],
        )
      ),
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.controller.createChatScreen(widget.chatId)),
          );
      },
    );
  }
}