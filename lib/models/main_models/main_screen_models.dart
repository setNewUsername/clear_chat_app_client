//chat list models

class ChatListElementModel{
  final String chatId;

  const ChatListElementModel({required this.chatId});

  String get id => chatId;
}

class ChatList{
  List<ChatListElementModel> chats = [];

  ChatList();

  set newChat(String chatId){
    chats.add(ChatListElementModel(chatId: chatId));
  }
}

//chat list models