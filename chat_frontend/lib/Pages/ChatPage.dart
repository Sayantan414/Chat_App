import 'package:chat_frontend/CustomUI/CustomCard.dart';
import 'package:chat_frontend/Models/ChatModel.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> chats = [
      ChatModel(
          name: "Sayantan Sadhu",
          icon: "person.svg",
          isGroup: false,
          time: "4:00",
          currentMessage: "Hi Guys"),
      ChatModel(
          name: "Deep",
          icon: "person.svg",
          isGroup: false,
          time: "4:00",
          currentMessage: "Hi Bro"),
      ChatModel(
          name: "Sayan",
          icon: "person.svg",
          isGroup: false,
          time: "4:00",
          currentMessage: "Hi Sis"),
      ChatModel(
          name: "Family Group",
          icon: "groups.svg",
          isGroup: true,
          time: "4:00",
          currentMessage: "Hi Everyone"),
      ChatModel(
          name: "Friends Group",
          icon: "groups.svg",
          isGroup: true,
          time: "4:00",
          currentMessage: "Hi Everyone")
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(chatModel: chats[index]),
      ),
    );
  }
}
