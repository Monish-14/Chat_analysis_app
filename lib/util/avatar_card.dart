import 'package:chat_app_with_data_analysis/model/chat_model.dart';
import 'package:flutter/material.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({super.key, required this.contact});
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 12),
          const Stack(
            children: [
              CircleAvatar(
                radius: 15,
                child: Icon(Icons.person),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 72, 5, 255),
                  radius: 5,
                  child: Icon(
                    Icons.clear,
                    size: 6,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          Text(contact.name, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
