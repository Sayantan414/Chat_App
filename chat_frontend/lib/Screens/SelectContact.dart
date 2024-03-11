import 'package:chat_frontend/CustomUI/ButtonCard.dart';
import 'package:chat_frontend/CustomUI/ContactCard.dart';
import 'package:chat_frontend/Models/ChatModel.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(
          name: "Sayantan Sadhu",
          icon: "person.svg",
          isGroup: false,
          time: "4:00",
          currentMessage: "Hi Guys",
          status: "A developer"),
      ChatModel(
          name: "Deep",
          icon: "person.svg",
          isGroup: false,
          time: "4:00",
          currentMessage: "Hi Bro",
          status: "A developer"),
      ChatModel(
          name: "Sayan",
          icon: "person.svg",
          isGroup: false,
          time: "4:00",
          currentMessage: "Hi Sis",
          status: "A developer"),
      ChatModel(
          name: "Family Group",
          icon: "groups.svg",
          isGroup: true,
          time: "4:00",
          currentMessage: "Hi Everyone",
          status: "A developer"),
      ChatModel(
          name: "Friends Group",
          icon: "groups.svg",
          isGroup: true,
          time: "4:00",
          currentMessage: "Hi Everyone",
          status: "A developer")
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Contact',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              "256 contacts",
              style: TextStyle(
                fontSize: 13,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 26,
            ),
          ),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return const [
              PopupMenuItem(
                  value: "Invite a friend", child: Text("Invite a friend")),
              PopupMenuItem(value: "Contacts", child: Text("Contacts")),
              PopupMenuItem(value: "Refresh", child: Text("Refresh")),
              PopupMenuItem(value: "Help", child: Text("Help")),
            ];
          })
        ],
      ),
      body: ListView.builder(
          itemCount: contacts.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return ButtonCard(name: "New group", icon: Icons.group);
            } else if (index == 1) {
              return ButtonCard(name: "New contact", icon: Icons.person_add);
            }
            return ContactCard(contact: contacts[index - 2]);
          }),
    );
  }
}
