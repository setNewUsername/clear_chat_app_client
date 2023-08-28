import 'package:flutter/material.dart';

class MessageContainer extends StatelessWidget{
  final String message;
  final bool currentUserInput;

  const MessageContainer({super.key, required this.message, required this.currentUserInput});

  @override
  Widget build(BuildContext context){
    return Container(
      alignment: currentUserInput? Alignment.centerRight : null,
      padding: const EdgeInsets.all(5),
      margin: EdgeInsets.only(
        top: 5, bottom: 0, 
        left: currentUserInput? 20: 0, 
        right: currentUserInput? 0 : 20
      ),
      color: currentUserInput? Theme.of(context).primaryColorLight : Theme.of(context).primaryColorDark,
      child: Text(message, style: const TextStyle(fontSize: 16))
    );
  }
}