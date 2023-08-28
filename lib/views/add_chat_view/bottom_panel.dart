//flutter imports
import 'package:flutter/material.dart';
//flutter imports

//controller import
import 'package:clear_chat_app/controllers/add_chat_controllers/add_chat_controller.dart';
//controller import

class ButtonPanel extends StatelessWidget{

  final AddNewChatController controller;

  const ButtonPanel({super.key, required this.controller});

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              child: Container(
                color: Colors.red,
                child: const Center(
                  child: Text('cancel')
                ),
              ),
              onTap: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
            ),
          ),
          Expanded(
            child: InkWell(
              child: Container(
                color: Theme.of(context).primaryColorLight,
                child: const Center(
                  child: Text('create')
                ),
              ),
              onTap: () {
                if (controller.addNewChat()){
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                }
              },
            )
          )
        ],
      )
    );
  }
}