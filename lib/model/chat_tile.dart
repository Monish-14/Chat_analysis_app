import 'package:chat_app_with_data_analysis/Pages/individual_chatpage.dart';
import 'package:chat_app_with_data_analysis/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (contex) => IndividualChatpage(chatModel: chatModel),
          ),
        );
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: chatModel.icon,
            ),
            title: Text(
              chatModel.name,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: Row(
              children: [
                const Icon(
                  Icons.done_all_outlined,
                  size: 18,
                ),
                const SizedBox(width: 5),
                Text(chatModel.currentMessage,
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 12,
                    )),
              ],
            ),
            trailing: Text(
              chatModel.time,
              style: GoogleFonts.poppins(
                color: Colors.grey,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 88.0, right: 22),
            child: Divider(thickness: 1),
          )
        ],
      ),
    );
  }
}
