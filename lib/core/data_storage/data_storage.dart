class ChatsDataStorage{
  Map<String, List<String>> messages = <String, List<String>>{};

  ChatsDataStorage();

  void addChat(String chatId){
    messages[chatId] = [];
  }

  bool saveMessage(String chatId, String newMessage){
    if (messages[chatId] != null){
      messages[chatId]!.add(newMessage);
      return true;
    } else {
      return false;
    }
  }

  List<String>? getMessagesById(String id){
    return messages[id];
  }
}