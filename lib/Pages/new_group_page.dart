import 'package:chat_app_with_data_analysis/model/chat_model.dart';
import 'package:chat_app_with_data_analysis/model/contact_card.dart';
import 'package:chat_app_with_data_analysis/util/avatar_card.dart';
import 'package:flutter/material.dart';

class NewGroupPage extends StatefulWidget {
  const NewGroupPage({super.key});

  @override
  State<NewGroupPage> createState() => _NewGroupPageState();
}

class _NewGroupPageState extends State<NewGroupPage> {
  List<ChatModel> groups = [];
  List<ChatModel> contact = [
    // ChatModel(
    //     icon: const Icon(Icons.groups), name: "New Group", status: ""),
    // ChatModel(
    //     icon: const Icon(Icons.person_add),
    //     name: "New Contact",
    //     status: ""),
    ChatModel(
      name: "Grace",
      status: "Full stack developer",
      icon: const Icon(Icons.person),
      time: "",
      currentMessage: "",
      isGroup: false,
    ),
    ChatModel(
      name: "Lin ",
      status: "Game developer ",
      icon: const Icon(Icons.person),
      time: "",
      currentMessage: "",
      isGroup: false,
    ),
    ChatModel(
      name: "Mitch ",
      status: "App developer",
      icon: const Icon(Icons.person),
      time: "",
      currentMessage: "",
      isGroup: false,
    ),
    ChatModel(
      name: "Luca",
      status: "Ethical hacking enthusiast ",
      icon: const Icon(Icons.person),
      time: "",
      currentMessage: "",
      isGroup: false,
    ),
    ChatModel(
      name: "Messi ",
      status: "Team leader at Argentina ",
      icon: const Icon(Icons.person),
      time: "",
      currentMessage: "",
      isGroup: false,
    ),
    ChatModel(
      name: "Ronaldo ",
      status: "Team leader at Portugal",
      icon: const Icon(Icons.person),
      time: "",
      currentMessage: "",
      isGroup: false,
    ),
    ChatModel(
      name: "Monish",
      status: "Flutter developer and Ethical hacker ",
      icon: const Icon(Icons.person),
      time: "",
      currentMessage: "",
      isGroup: false,
    ),
    ChatModel(
      name: "Jeevitha",
      status: "Web developer ",
      icon: const Icon(Icons.person),
      time: "",
      currentMessage: "",
      isGroup: false,
    ),
    ChatModel(
      name: "Naveen",
      status: "Information security analyst",
      icon: const Icon(Icons.person),
      time: "",
      currentMessage: "",
      isGroup: false,
    ),
    ChatModel(
      name: "Karthi",
      status: "Full stack app developer",
      icon: const Icon(Icons.person),
      time: "",
      currentMessage: "",
      isGroup: false,
    ),
    ChatModel(
      name: "Dhanush",
      status: "UI / UX designer",
      icon: const Icon(Icons.person),
      time: "",
      currentMessage: "",
      isGroup: false,
    ),
    ChatModel(
      name: "Bala ",
      status: "Software engineer",
      icon: const Icon(Icons.person),
      time: "",
      currentMessage: "",
      isGroup: false,
    ),
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
            Text("New Group", style: Theme.of(context).textTheme.bodyLarge),
            Text("Add participants",
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 26,
              )),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: contact.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    height: groups.isNotEmpty ? 90 : 10,
                  );
                }
                return InkWell(
                  onTap: () {
                    if (contact[index - 1].selected == false) {
                      setState(() {
                        contact[index - 1].selected = true;
                        groups.add(contact[index]);
                      });
                    } else {
                      setState(() {
                        contact[index - 1].selected = false;
                        groups.remove(contact[index - 1]);
                      });
                    }
                    //print(contact[index].selected);
                  },
                  child: ContactCard(chatModel: contact[index - 1]),
                );
              }),
          groups.isNotEmpty
              ? Column(
                  children: [
                    Container(
                      height: 75,
                      color: Colors.white,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          if (contact[index].selected == true) {
                            return InkWell(
                                onTap: () {
                                  setState(() {
                                    groups.remove(contact[index]);
                                    contact[index].selected = false;
                                  });
                                },
                                child: AvatarCard(contact: contact[index]));
                          }
                          return Container();
                        },
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
