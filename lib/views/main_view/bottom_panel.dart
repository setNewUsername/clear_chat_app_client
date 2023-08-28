//flutter imports
import 'package:flutter/material.dart';
//flutter imports

//controller import
import 'package:clear_chat_app/controllers/main_controllers/main_screen_controller.dart';
//controller import

class ButtonPanel extends StatelessWidget{

  final MainSreenController controller;

  const ButtonPanel({super.key, required this.controller});

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 60,
      child: InkWell(
        child: Container(
          color: Theme.of(context).primaryColorDark,
          child: const Center(
            child: Icon(
              Icons.add_box_outlined,
              size: 35,
            )
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => controller.createAddChatScreen()),
          );
        },
      ),
    );
  }
}