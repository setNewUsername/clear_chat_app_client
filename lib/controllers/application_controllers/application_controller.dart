import 'package:flutter/material.dart';
import 'package:clear_chat_app/core/controller/core_controller.dart';

//main view imports
import 'package:clear_chat_app/views/main_view/main_screen.dart';
import 'package:clear_chat_app/controllers/main_controllers/main_screen_controller.dart';
//main view imports

class ApplicationController extends CoreController{

  ApplicationController();

  Widget createMainScreen(){
    MainSreenController controller = MainSreenController();
    MainScreen screen = MainScreen(controller: controller);
    return screen;
  }

  @override
  void interControllerDataTransitionMethod(Object dataObject) {}
}