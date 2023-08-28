//flutter imports
import 'package:flutter/material.dart';
//flutter imports

import 'package:clear_chat_app/models/main_models/main_screen_models.dart';
import 'package:clear_chat_app/core/controller/core_controller.dart';
//import 'dart:developer' as dev;

//signals imports
import 'package:clear_chat_app/core/controller/main_screen_signals_enums.dart';
//signals imports

//add chat imports
import 'package:clear_chat_app/controllers/add_chat_controllers/add_chat_controller.dart';
import 'package:clear_chat_app/views/add_chat_view/add_chat_view.dart';
//add chat imports

//chat screen imports
import 'package:clear_chat_app/controllers/chat_controllers/chat_screen_controller.dart';
import 'package:clear_chat_app/views/chat_view/chat_screen.dart';
//chat screen imports

//data transition models imports
import 'package:clear_chat_app/core/data_transition_models/main_scr_add_ch_scr_model.dart';
//data transition models imports

//core imports
import 'package:clear_chat_app/core/data_storage/data_storage.dart';
//core imports

class MainSreenController extends CoreController{
  //init models
  ChatList chList = ChatList();
  ChatsDataStorage chatsHistoryDataStorage = ChatsDataStorage();
  //init models

  MainSreenController();
  
  void addNewChat(){
    chList.newChat = 'test add chat';
    notifyView(MainUpdateViewSignals.updateAll);
  }

  Widget createAddChatScreen(){
    AddNewChatController controller = AddNewChatController(
        mainScreenTransDataMethod:interControllerDataTransitionMethod,
        dataStorage: chatsHistoryDataStorage
      );
    return AddNewChatScreen(controller: controller);
  }

  Widget createChatScreen(String chatId){
    ChatSreenController controller = ChatSreenController(chatId: chatId, chatDataStorage: chatsHistoryDataStorage);
    return ChatScreen(controller: controller);
  }

  @override
  void interControllerDataTransitionMethod(Object dataObject) {
    NewChatSettingTransitionModel data = dataObject as NewChatSettingTransitionModel;
    chList.newChat = data.chatId;
    notifyView(MainUpdateViewSignals.updateAll);
  }
}