import 'package:chat_app_with_data_analysis/Pages/new_group_page.dart';
import 'package:chat_app_with_data_analysis/model/chat_model.dart';
import 'package:chat_app_with_data_analysis/model/contact_card.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  List<ChatModel> contacts = [
    ChatModel(
      name: "New Group",
      icon: const Icon(Icons.groups),
      time: "14:11",
      currentMessage: "Hello this Monish ",
      isGroup: false,
      status: '',
    ),
    ChatModel(
      name: "New contact",
      icon: const Icon(Icons.person_add),
      time: "14:11",
      currentMessage: "Hello this Monish ",
      isGroup: false,
      status: '',
    ),
    ChatModel(
      name: "Monish",
      icon: const Icon(Icons.person),
      time: "14:11",
      currentMessage: "Hello this Monish ",
      isGroup: false,
      status: 'Hello !!!!',
    ),
    ChatModel(
        name: "Sanjay",
        icon: const Icon(Icons.person),
        time: "14:11",
        currentMessage: "Welcome to my channel !!",
        isGroup: false,
        status: 'Hello !!!!'),
    ChatModel(
        name: "Arnold",
        icon: const Icon(Icons.person),
        time: "12:10",
        currentMessage: "Time for a nap",
        isGroup: false,
        status: 'Hello !!!!'),
    ChatModel(
        name: "David goggins",
        icon: const Icon(Icons.person),
        time: "4:00",
        currentMessage: "Heyy !!!!!!",
        isGroup: false,
        status: 'Hello !!!!'),
    ChatModel(
        name: "Huberman Lab",
        icon: const Icon(Icons.person),
        time: "4:11",
        currentMessage: "Your show was awesome !!",
        isGroup: false,
        status: 'Hello !!!!'),
    ChatModel(
        name: "Ariana Grande",
        icon: const Icon(Icons.person),
        time: "1:00",
        currentMessage: "Big fan mam !",
        isGroup: false,
        status: 'Hello !!!!'),
    ChatModel(
        name: "Bille Eilish",
        icon: const Icon(Icons.person),
        time: "11:14",
        currentMessage: "Had lunch ??",
        isGroup: false,
        status: 'Hello !!!!'),
    ChatModel(
        name: "Mom",
        icon: const Icon(Icons.person),
        time: "11:11",
        currentMessage: "Take care <>",
        isGroup: false,
        status: 'Hello !!!!'),
    ChatModel(
        name: "Will Smith",
        icon: const Icon(Icons.person),
        time: "14:11",
        currentMessage: "Waiting for your next film ",
        isGroup: false,
        status: 'Hello !!!!'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).hintColor,
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Contact",
                style: Theme.of(context).textTheme.bodyLarge),
            Text("100 Contacts", style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 26,
              )),
          PopupMenuButton(
            onSelected: (value) {},
            itemBuilder: (builder) {
              return [
                PopupMenuItem(
                  child: Text("Invite a friend",
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
                PopupMenuItem(
                  child: Text("Contacts",
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
                PopupMenuItem(
                  child: Text("Refresh",
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
                PopupMenuItem(
                  child: Text("Help",
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
              ];
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(
                onTap: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const NewGroupPage()));
                  });
                },
                child: ContactCard(
                  chatModel: contacts[index],
                ),
              );
            } else if (index == 1) {
              return InkWell(
                onTap: () {},
                child: ContactCard(chatModel: contacts[index]),
              );
            }
            return InkWell(
              onTap: () {},
              child: ContactCard(chatModel: contacts[index]),
            );
          }),
    );
  }
}
