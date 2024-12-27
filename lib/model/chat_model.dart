import 'package:flutter/material.dart';

class ChatModel {
  String name;
  Icon icon;
  bool isGroup;
  String time;
  String currentMessage;
  String status;
  bool selected;
  ChatModel({
    required this.name,
    required this.icon,
    required this.time,
    required this.currentMessage,
    required this.isGroup,
    required this.status,
    this.selected = false,
  });
}
