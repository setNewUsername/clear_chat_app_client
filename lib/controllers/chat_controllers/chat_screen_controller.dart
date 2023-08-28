//flutter imports
import 'package:flutter/material.dart';
//flutter imports

import 'package:clear_chat_app/core/controller/core_controller.dart';
//import 'dart:developer' as dev;

//models imports
import 'package:clear_chat_app/models/chat_models/chat_screen_models.dart';
//models imports

//signals imports
import 'package:clear_chat_app/core/controller/chat_screen_signals_enums.dart';
//signals imports

//core imports
import 'package:clear_chat_app/core/data_storage/data_storage.dart';
//core imports

//data transition models imports

//data transition models imports

class ChatSreenController extends CoreController{
  //init models
  MessageHistoryModel messageHistory = MessageHistoryModel();
  final ChatsDataStorage chatDataStorage;
  final String chatId;
  //init models

  ChatSreenController({required this.chatId, required this.chatDataStorage}){
    //show bug to Alice messageHistory.addMessagesFromList = chatDataStorage.getMessagesById(chatId) ?? [];
    messageHistory.addMessagesFromList = List<String>.from(chatDataStorage.getMessagesById(chatId) ?? []);
  }
  
  void addMessage(String msg){
    if(chatDataStorage.saveMessage(chatId, msg)){
      messageHistory.addMessage = msg;
      notifyView(ChatScreenUpdateViewSignals.updateAll);
    }
  }

  @override
  void interControllerDataTransitionMethod(Object dataObject) {
  }
}