import 'package:chat_app_with_data_analysis/Pages/select_contact.dart';
import 'package:chat_app_with_data_analysis/model/chat_model.dart';
import 'package:chat_app_with_data_analysis/model/chat_tile.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  List<ChatModel> chats = [
    ChatModel(
      name: "Monish",
      icon: const Icon(Icons.groups),
      time: "14:11",
      currentMessage: "Hello this Monish ",
      isGroup: false,
      status: "Hey there",
    ),
    ChatModel(
      name: "Sanjay",
      icon: const Icon(Icons.groups),
      time: "14:11",
      currentMessage: "Welcome to my channel !!",
      isGroup: false,
      status: "Hey there",
    ),
    ChatModel(
      name: "Arnold",
      icon: const Icon(Icons.groups),
      time: "12:10",
      currentMessage: "Time for a nap",
      isGroup: false,
      status: "Hey there",
    ),
    ChatModel(
        name: "David goggins",
        icon: const Icon(Icons.groups),
        time: "4:00",
        currentMessage: "Heyy !!!!!!",
        isGroup: false,
        status: "Hey there"),
    ChatModel(
        name: "Huberman Lab",
        icon: const Icon(Icons.groups),
        time: "4:11",
        currentMessage: "Your show was awesome !!",
        isGroup: false,
        status: "Hey there"),
    ChatModel(
        name: "Ariana Grande",
        icon: const Icon(Icons.groups),
        time: "1:00",
        currentMessage: "Big fan mam !",
        isGroup: false,
        status: "Hey there"),
    ChatModel(
        name: "Bille Eilish",
        icon: const Icon(Icons.groups),
        time: "11:14",
        currentMessage: "Had lunch ??",
        isGroup: false,
        status: "Hey there"),
    ChatModel(
        name: "Mom",
        icon: const Icon(Icons.groups),
        time: "11:11",
        currentMessage: "Take care <>",
        isGroup: false,
        status: "Hey there"),
    ChatModel(
        name: "Will Smith",
        icon: const Icon(Icons.groups),
        time: "14:11",
        currentMessage: "Waiting for your next film ",
        isGroup: false,
        status: "Hey there"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) => const SelectContact(),
            ),
          );
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(Icons.chat_outlined, color: Colors.white),
      ),

      //chat tiles
      body: ListView.builder(
        itemCount: chats.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ChatTile(chatModel: chats[index]),
          );
        },
      ),

      backgroundColor: Theme.of(context).hintColor,
    );
  }
}
