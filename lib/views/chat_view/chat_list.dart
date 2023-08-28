import 'package:flutter/material.dart';

//core imports
import 'package:clear_chat_app/core/view/controller_client.dart';
//core imports

//view parts imports
import 'package:clear_chat_app/views/chat_view/chat_message_container.dart';
//view parts imports

//controllers imports
import 'package:clear_chat_app/controllers/chat_controllers/chat_screen_controller.dart';
//controllers imports

//signals imports
import 'package:clear_chat_app/core/controller/chat_screen_signals_enums.dart';
//signal imports

class ChatList extends StatefulWidget{

  final ChatSreenController controller;

  const ChatList({super.key, required this.controller});

  @override
  State<ChatList> createState() => ChatListState();
}

class ChatListState extends State<ChatList> with ContollerClient{

  List<Widget> chatList = [];

  ChatListState();

  List<Widget> fillChatList(List<String> messages){
    List<Widget> tmpList = [];
    for(int index = 0; index < messages.length; index++){
      tmpList.add(MessageContainer(message: messages[index],
      currentUserInput: index % 2 == 0 ? false : true));
    }
    return tmpList;
  }

  @override
  void updateMethod(Enum signal){
    switch (signal){
        case ChatScreenUpdateViewSignals.updateAll:
        setState(() {
          chatList = fillChatList(widget.controller.messageHistory.msgs);
        });
        break;
        default:
        break;
      }
  }

  @override
  void initState(){
    super.initState();
    widget.controller.viewNotifyMethod = updateMethod;
    List<String>? chatHistory = widget.controller.chatDataStorage.getMessagesById(widget.controller.chatId);
    chatList = fillChatList(chatHistory ?? []);
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(5.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              chatList
            ),
          ),
        ),
      ],
    );
  }
}