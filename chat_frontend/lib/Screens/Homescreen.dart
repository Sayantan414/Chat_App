import 'package:chat_frontend/Pages/ChatPage.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("F**Chat"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return const [
              PopupMenuItem(value: "New Group", child: Text("New Group")),
              PopupMenuItem(
                  value: "New broadcast", child: Text("New broadcast")),
              PopupMenuItem(value: "Whatsapp Web", child: Text("Whatsapp Web")),
              PopupMenuItem(
                  value: "Starred messages", child: Text("Starred messages")),
              PopupMenuItem(value: "Settings", child: Text("Settings")),
            ];
          })
        ],
        bottom: TabBar(
          controller: _controller,
          tabs: const [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            ),
          ],
          labelColor: Colors.white,
          unselectedLabelColor: const Color.fromARGB(255, 167, 228, 247),
          indicatorColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Text("camera"),
          ChatPage(),
          Text("status"),
          Text("calls"),
        ],
      ),
    );
  }
}
