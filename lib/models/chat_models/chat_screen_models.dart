class MessageHistoryModel{
  List<String> messages = [];

  MessageHistoryModel();

  List<String> get msgs => messages;

  set addMessage(String newMessage){
    messages.add(newMessage);
  }

  set addMessagesFromList(List<String> msgs){
    messages = msgs;
  }
}