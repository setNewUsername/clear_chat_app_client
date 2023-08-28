import 'package:clear_chat_app/core/controller/core_controller.dart';
//import 'dart:developer' as dev;
import 'package:uuid/uuid.dart';

//models imports
import 'package:clear_chat_app/models/add_chat_models/new_chat_settings_model.dart';
//models imports

//core imports
//import 'package:clear_chat_app/core/controller/add_new_chat_screen_signals_enums.dart';
import 'package:clear_chat_app/core/data_storage/data_storage.dart';
//core imports

//data transition models imports
import 'package:clear_chat_app/core/data_transition_models/main_scr_add_ch_scr_model.dart';
//data transition models imports

class AddNewChatController extends CoreController{
  //init models
  NewChatSettings chatSettings = NewChatSettings();
  //init models

  final ChatsDataStorage dataStorage;

  Uuid uuid = const Uuid();

  Function mainScreenTransDataMethod;

  AddNewChatController({required this.mainScreenTransDataMethod, required this.dataStorage}){
    chatSettings.chatId = uuid.v4();
  }

  bool addNewChat(){
    mainScreenTransDataMethod.call(NewChatSettingTransitionModel(
      chatId:chatSettings.chatId, 
      maxParticipantsAmount: chatSettings.maxParticipantsAmount
      ));
    dataStorage.addChat(chatSettings.chatId);
    return true;
  }

  @override
  void interControllerDataTransitionMethod(Object dataObject) {}
}