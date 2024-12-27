import 'package:chat_app_with_data_analysis/model/chat_model.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

class IndividualChatpage extends StatefulWidget {
  const IndividualChatpage({super.key, required this.chatModel});
  final ChatModel chatModel;
  @override
  State<IndividualChatpage> createState() => _IndividualChatpageState();
}

class _IndividualChatpageState extends State<IndividualChatpage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        show = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      appBar: AppBar(
          leadingWidth: 28,
          title: InkWell(
            onTap: () {},
            child: Row(
              children: [
                CircleAvatar(child: widget.chatModel.icon),
                const SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.chatModel.name,
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("Last seen at 10 pm ",
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
            const SizedBox(width: 15),
            IconButton(icon: const Icon(Icons.call), onPressed: () {}),
            const SizedBox(width: 15),
            PopupMenuButton(itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text("Contact info",
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
                PopupMenuItem(
                  child: Text("Select messages",
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
                PopupMenuItem(
                  child: Text("Mute notifications",
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
                PopupMenuItem(
                  child: Text("Disappearing messages",
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
                PopupMenuItem(
                  child: Text("Add to favorites",
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
                PopupMenuItem(
                  child: Text("Close chat",
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
                PopupMenuItem(
                  child: Text("Report",
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
                PopupMenuItem(
                  child: Text("Block",
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
                PopupMenuItem(
                  child: Text("Clear chat",
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
                PopupMenuItem(
                  child: Text("Delete chat",
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
              ];
            })
          ]),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: WillPopScope(
          onWillPop: () {
            if (show) {
              setState(() {
                show = false;
              });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
          child: Stack(children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        //padding: const EdgeInsets.only(right: 45, bottom: 13),
                        width: MediaQuery.of(context).size.width - 53,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),

                          //TEXT FIELD !!
                          child: TextFormField(
                            controller: _controller,
                            focusNode: focusNode,
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            minLines: 1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Type a message",
                              contentPadding: const EdgeInsets.all(15),
                              prefixIcon: IconButton(
                                onPressed: () {
                                  focusNode.unfocus();
                                  focusNode.canRequestFocus = false;
                                  setState(() {
                                    show = !show;
                                  });
                                },
                                icon: const Icon(Icons.emoji_emotions_rounded),
                              ),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (builder) => bottomsheet());
                                    },
                                    icon: const Icon(Icons.attach_file),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 18),
                                    child: IconButton(
                                        icon: const Icon(
                                            Icons.camera_front_rounded),
                                        onPressed: () {}),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 25,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.mic),
                        ),
                      ),
                    ],
                  ),
                  show ? emojiSelect() : Container(),
                ],
              ),
            ),
          ]),
        ),
      ),
      // floatingActionButton: Align(
      //   alignment: Alignment.bottomRight,
      //   child: SizedBox(
      //     width: 50,
      //     height: 50,
      //     child: FloatingActionButton(
      //       shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(25)),
      //       onPressed: () {},
      //       child: const Icon(Icons.mic),
      //     ),
      //   ),
      // )
    );
  }

  Widget bottomsheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                iconCreation(
                    Icons.insert_drive_file_rounded, Colors.indigo, "Document"),
                iconCreation(Icons.camera_alt_rounded, Colors.pink, "Camera"),
                iconCreation(
                    Icons.insert_photo_rounded, Colors.purple, " Gallery "),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                iconCreation(Icons.headset_rounded, Colors.orange, "Audio"),
                iconCreation(Icons.location_pin, Colors.pinkAccent, "Location"),
                iconCreation(Icons.person, Colors.blue, "Contact"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget iconCreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(text, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      config: const Config(),
      onEmojiSelected: (category, emoji) {
        _controller.text = _controller.text + emoji.emoji;
      },
    );
  }
}
