import 'package:flutter/material.dart';

//core imports
import 'package:clear_chat_app/core/view/controller_client.dart';
import 'package:clear_chat_app/core/controller/main_screen_signals_enums.dart';
//core imports

//models imports
import 'package:clear_chat_app/models/main_models/main_screen_models.dart';
//models imports

//controller imports
import 'package:clear_chat_app/controllers/main_controllers/main_screen_controller.dart';
//controller import

//view parts imports
import 'package:clear_chat_app/views/main_view/chat_list_element.dart';
//view parts imports

//import 'dart:developer' as dev;

class ChatsList extends StatefulWidget{

  final MainSreenController controller;

  const ChatsList({super.key, required this.controller});

  @override
  State<ChatsList> createState() => ChatsListState();
}

class ChatsListState extends State<ChatsList> with ContollerClient{

  List<Widget> chatList = [];

  ChatsListState();

  List<Widget> fillChatList(List<ChatListElementModel> modelList){
    List<Widget> tmpList = [];
    for(int index = 0; index < modelList.length; index++){
      tmpList.add(ChatListElement(chatId: modelList[index].chatId, controller: widget.controller));
    }
    return tmpList;
  }

  @override
  void updateMethod(Enum signal){
    switch (signal){
        case MainUpdateViewSignals.updateAll:
        setState(() {
          //get chat list from model from controller
          chatList = fillChatList(widget.controller.chList.chats);
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
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(10.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                chatList
              ),
            ),
          ),
        ],
      ),
    );
  }
}