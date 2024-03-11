import 'package:chat_frontend/Models/ChatModel.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;
  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 158, 203, 239),
      appBar: AppBar(
        leadingWidth: 70,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.arrow_back, size: 24),
              CircleAvatar(
                child: SvgPicture.asset(
                  widget.chatModel.isGroup
                      ? "assets/groups.svg"
                      : "assets/person.svg",
                  // ignore: deprecated_member_use
                  color: Colors.white,
                  height: 35,
                  width: 35,
                ),
              )
            ],
          ),
        ),
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chatModel.name,
                  style: const TextStyle(
                      fontSize: 18.5, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  "Last seen today at 12:05",
                  style: TextStyle(
                      fontSize: 12, color: Color.fromARGB(255, 222, 221, 221)),
                )
              ],
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return const [
              PopupMenuItem(value: "View Contact", child: Text("View Contact")),
              PopupMenuItem(
                  value: "Media, links, and docs",
                  child: Text("Media, links, and docs")),
              PopupMenuItem(value: "Whatsapp Web", child: Text("Whatsapp Web")),
              PopupMenuItem(value: "Search", child: Text("Search")),
              PopupMenuItem(
                  value: "Mute Notification", child: Text("Mute Notification")),
              PopupMenuItem(value: "Wallpaper", child: Text("Wallpaper")),
            ];
          })
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ListView(),
            Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width - 55,
                            child: Card(
                              margin: const EdgeInsets.only(
                                  left: 2, right: 2, bottom: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextFormField(
                                controller: _controller,
                                focusNode: focusNode,
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                minLines: 1,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Type a message",
                                  prefixIcon: IconButton(
                                    icon: const Icon(Icons.emoji_emotions,
                                        color:
                                            Color.fromARGB(255, 6, 100, 178)),
                                    onPressed: () {
                                      focusNode.unfocus();
                                      focusNode.canRequestFocus = false;
                                      setState(() {
                                        show != show;
                                      });
                                    },
                                  ),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (builder) =>
                                                  bottomSheet());
                                        },
                                        icon: const Icon(Icons.attach_file),
                                        color: const Color.fromARGB(
                                            255, 6, 100, 178),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.camera_alt),
                                          color: const Color.fromARGB(
                                              255, 6, 100, 178))
                                    ],
                                  ),
                                  contentPadding: const EdgeInsets.all(5),
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8, left: 2),
                          child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 6, 100, 178),
                              radius: 25,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.mic),
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                    show ? emojiSelect() : Container(),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
        height: 278,
        width: MediaQuery.of(context).size.width,
        child: Card(
            margin: const EdgeInsets.all(18),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      iconCreation(
                          Icons.insert_drive_file, Colors.indigo, "Document"),
                      const SizedBox(
                        width: 40,
                      ),
                      iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                      const SizedBox(
                        width: 40,
                      ),
                      iconCreation(Icons.insert_photo, Colors.purple, "Gallery")
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      iconCreation(Icons.headset, Colors.orange, "Audio"),
                      const SizedBox(
                        width: 40,
                      ),
                      iconCreation(Icons.location_pin, Colors.teal, "Location"),
                      const SizedBox(
                        width: 40,
                      ),
                      iconCreation(Icons.person, Colors.blue, "Contact")
                    ],
                  ),
                ],
              ),
            )));
  }

  Widget iconCreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      onEmojiSelected: (emoji, category) {
        _controller.text = _controller.text + emoji.toString();
      },
    );
  }
}
