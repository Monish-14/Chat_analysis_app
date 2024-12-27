import 'package:flutter/material.dart';

class CallsPage extends StatefulWidget {
  const CallsPage({super.key});
  @override
  State<CallsPage> createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text("This is Calls page",
              style: Theme.of(context).textTheme.bodyMedium)),
    );
  }
}
