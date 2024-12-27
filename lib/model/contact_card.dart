import 'package:chat_app_with_data_analysis/model/chat_model.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final ChatModel chatModel;
  const ContactCard({
    super.key,
    required this.chatModel,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        children: [
          ListTile(
            leading: SizedBox(
              width: 50,
              height: 50,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 25,
                    child: chatModel.icon,
                  ),
                  if (chatModel.selected)
                    const Positioned(
                      right: 0,
                      bottom: 0,
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 72, 5, 255),
                        radius: 8,
                        child: Icon(
                          Icons.check,
                          size: 12,
                          color: Colors.white,
                        ),
                      ),
                    )
                ],
              ),
            ),
            title: Text(chatModel.name,
                style: Theme.of(context).textTheme.bodyMedium),
            subtitle: chatModel.status == ""
                ? null
                : Text(chatModel.status,
                    style: Theme.of(context).textTheme.bodySmall),
          ),
          // const Padding(
          //   padding: EdgeInsets.only(left: 78.0, right: 22),
          //   child: Divider(thickness: 1),
          // ),
        ],
      ),
    );
  }
}
