import 'package:chat_frontend/CustomUI/AvtarCard.dart';
import 'package:chat_frontend/CustomUI/ButtonCard.dart';
import 'package:chat_frontend/CustomUI/ContactCard.dart';
import 'package:chat_frontend/Models/ChatModel.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel(
        name: "Sayantan Sadhu",
        icon: "person.svg",
        isGroup: false,
        time: "4:00",
        currentMessage: "Hi Guys",
        status: "A developer",
        select: false),
    ChatModel(
        name: "Deep",
        icon: "person.svg",
        isGroup: false,
        time: "4:00",
        currentMessage: "Hi Bro",
        status: "A developer",
        select: false),
    ChatModel(
        name: "Sayan",
        icon: "person.svg",
        isGroup: false,
        time: "4:00",
        currentMessage: "Hi Sis",
        status: "A developer",
        select: false),
    ChatModel(
        name: "Family Group",
        icon: "groups.svg",
        isGroup: true,
        time: "4:00",
        currentMessage: "Hi Everyone",
        status: "A developer",
        select: false),
    ChatModel(
        name: "Friends Group",
        icon: "groups.svg",
        isGroup: true,
        time: "4:00",
        currentMessage: "Hi Everyone",
        status: "A developer",
        select: false)
  ];
  List<ChatModel> groups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Group',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              "Add participents",
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
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      if (contacts[index].select == false) {
                        setState(() {
                          contacts[index].select = true;
                          groups.add(contacts[index]);
                        });
                      } else {
                        setState(() {
                          contacts[index].select = false;
                          groups.remove(contacts[index]);
                        });
                      }
                    },
                    child: ContactCard(contact: contacts[index]));
              }),
          groups.isNotEmpty
              ? Column(
                  children: [
                    Container(
                      height: 75,
                      color: Colors.white,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            if (contacts[index].select == true) {
                              return InkWell(
                                  onTap: () {
                                    setState(() {
                                      groups.remove(contacts[index]);
                                      contacts[index].select = false;
                                    });
                                  },
                                  child: AvtarCard(contact: contacts[index]));
                            } else {
                              return Container();
                            }
                          }),
                    ),
                    const Divider(
                      thickness: 1,
                    )
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
